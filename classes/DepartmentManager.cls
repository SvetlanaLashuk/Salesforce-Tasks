public class DepartmentManager {
    public static Department__c createDepartment(String name, Id officeId) {
        Department__c department = new Department__c(
            Name = name,
            Office__c = officeId
        );
        Database.SaveResult sv = Database.insert(department);
        return department;
    }
    
    public static Department__c updateDepartment(Id departmentId, String name) {
        Department__c department = new Department__c(
            Id = departmentId,
            Name = name
        );
        Database.SaveResult sv = Database.update(department);
        return department;
    }
    
    public static Boolean deleteDepartment(Id departmentId) {
        try {
       		delete new Department__c(Id = departmentId);
        } catch(Exception ex) {
            return false;
        }
        return true;
    }
    
    public static Department__c getDepartmentById(Id departmentId) {
        Department__c department = [select Name, AverageSalary__c, CountEmployee__c, 
                                    Count_Employee_WorkFlow__c, Email_director__c, 
                                    MaxSummary__c, MinSummary__c, Office__c, 
                                    SumSummary__c from Department__c where id = :departmentId];
        return department;
    }
}