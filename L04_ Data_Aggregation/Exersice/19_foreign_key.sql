CREATE TABLE employees_projects(
    id  SERIAL PRIMARY KEY NOT NULL,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    CONSTRAINT fk_employee_id FOREIGN KEY(employee_id) REFERENCES employees(id),
    CONSTRAINT fk_project_id FOREIGN KEY(project_id) REFERENCES projects(id)
)