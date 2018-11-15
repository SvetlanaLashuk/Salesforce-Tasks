<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_about_expiration_date</fullName>
        <description>Email about expiration date</description>
        <protected>false</protected>
        <recipients>
            <field>Email_manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Data</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_exp</fullName>
        <description>Send Email exp</description>
        <protected>false</protected>
        <recipients>
            <field>Email_manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Data</template>
    </alerts>
    <alerts>
        <fullName>Send_email</fullName>
        <description>Send email</description>
        <protected>false</protected>
        <recipients>
            <field>Email_manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_employee_for_manager</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Department_Employee_Count</fullName>
        <field>Count_Employee_Workflow__c</field>
        <formula>IF(ISBLANK(Department__r.Count_Employee_Workflow__c), 1, Department__r.Count_Employee_Workflow__c+1)</formula>
        <name>Update Department Employee Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Department__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_manager_email</fullName>
        <field>Email_manager__c</field>
        <formula>Manager__r.Email__c</formula>
        <name>Update manager email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Calculate count employees</fullName>
        <actions>
            <name>Update_Department_Employee_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Department__c  &lt;&gt;  null</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>new employee send email to manager</fullName>
        <actions>
            <name>Email_about_expiration_date</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Send_email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_manager_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK( Manager__r.Email__c  ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_exp</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Employee__c.Expiration_Date__c</offsetFromField>
            <timeLength>-10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
