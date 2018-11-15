<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email</fullName>
        <description>Send email</description>
        <protected>false</protected>
        <recipients>
            <field>Email_director__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_department</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_email_field</fullName>
        <field>Email_director__c</field>
        <formula>Office__r.Director__r.Email__c</formula>
        <name>update email field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>send email to director when new department is added</fullName>
        <actions>
            <name>Send_email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>update_email_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISNULL(Office__r.Director__r.Email__c  ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
