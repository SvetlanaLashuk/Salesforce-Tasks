public class EmployeeManager {
    
    public static Employee__c createEmployee(String lastName, String firstName, Id departmentId) {
        Employee__c employee = new Employee__c (
        	Name = lastName,
        	FirstName__c = firstName,
        	Department__c = departmentId
        );            
        
        Database.SaveResult sv = Database.insert(employee);
        return employee;
    }
    
    public static Boolean deleteEmployee(Id employeeId) {
        try {
       		delete new Employee__c(Id = employeeId);
        } catch(Exception ex) {
            return false;
        }
        
        return true;
    }
    
    public static Employee__c updateEmployee(Id employeeId, String lastName, String firstName) {
        Employee__c employee = new Employee__c(
            Id = employeeId,
        	Name = lastName,
        	FirstName__c = firstName        
        );            
        
        Database.SaveResult sv = Database.update(employee);
        return employee;
    }
    
    public static Employee__c getEmployeeById(Id employeeId) {
        Employee__c employee = [select Name from Employee__c where id = :employeeId];
        return employee;
    }
}