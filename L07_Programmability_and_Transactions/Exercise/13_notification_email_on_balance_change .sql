-- Step 1: Create the notification_emails table
CREATE TABLE notification_emails (
    id SERIAL PRIMARY KEY,
    recipient_id INT NOT NULL,
    subject TEXT NOT NULL,
    body TEXT NOT NULL
);

-- Step 2: Create the function trigger_fn_send_email_on_balance_change
CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO notification_emails (recipient_id, subject, body)
    VALUES (
        NEW.account_id,
        'Balance change for account: ' || NEW.account_id,
        'On ' || CURRENT_DATE || ' your balance was changed from ' || OLD.old_sum || ' to ' || NEW.new_sum || '.'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 3: Create the trigger tr_send_email_on_balance_change
CREATE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW
WHEN (OLD.new_sum IS DISTINCT FROM NEW.new_sum)
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();

-- Example data and update
-- Insert an initial row for testing
INSERT INTO logs (account_id, old_sum, new_sum)
VALUES (1, 5323.12, 150.00);

-- Update the new_sum value to trigger the email notification
UPDATE logs
SET new_sum = new_sum + 100
WHERE account_id = 1;

-- Check the notification_emails table for the new email notification
SELECT * FROM notification_emails;
