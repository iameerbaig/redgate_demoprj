CREATE OR REPLACE TRIGGER demo.secure_employees
  BEFORE INSERT OR UPDATE OR DELETE ON demo.employees
DISABLE BEGIN
  secure_dml;
END secure_employees;
/