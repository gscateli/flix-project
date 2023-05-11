@isTest
private class AccountContractInvocableTest {

    @TestSetup
    private static void setup(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.BillingCountry = 'USA';

        insert acc;


        AccountContract__c accCtn = new AccountContract__c();
        accCtn.Contracts__c = [SELECT Id FROM Account LIMIT 1].Id;

        insert accCtn;

        AccountContractClause__c ctnClause = new AccountContractClause__c();
        AccountContractClause__c ctnClause2 = new AccountContractClause__c();
        AccountContractClause__c ctnClause3 = new AccountContractClause__c();

        ctnClause.Name = 'Clause 1';
        ctnClause.ClauseDescription__c = 'This is about clause 1';

        ctnClause2.Name = 'Clause 2';
        ctnClause2.ClauseDescription__c = 'This is about clause 2';

        ctnClause3.Name = 'Clause 3';
        ctnClause3.ClauseDescription__c = 'This is about clause 3';
        
        insert ctnClause;
        insert ctnClause2;
        insert ctnClause3;
    }

    @isTest
    private static void generateContractFileTest() {

        Accountcontract__c accCtn = [SELECT Id, Name FROM Accountcontract__c LIMIT 1];
        List<AccountContractClause__c> ctnClauses = [SELECT Id, Name FROM AccountContractClause__c];

        List<String> clauseNamesLst = new List<String>();

        for(AccountContractClause__c cc : ctnClauses) {
            clauseNamesLst.add(cc.Name);
        }


        AccountContractInvocable.InputVariables fileVars = new AccountContractInvocable.InputVariables();
        fileVars.contractId = accCtn.Id;
        fileVars.pdfContent = 'Account Contract: ' + accCtn.Id + 'Contract Clauses: ' + clauseNamesLst;
        fileVars.pdfExtension = 'pdf';
        fileVars.pdfTitle = 'Contract ' + accCtn.Name;

        List<AccountContractInvocable.InputVariables> fileVarsLst = new List<AccountContractInvocable.InputVariables>();
        fileVarsLst.add(fileVars);

        List<AccountContractInvocable.OutputVariables> outputVars = AccountContractInvocable.generateContractPdf(fileVarsLst);

        System.assertEquals(true, outputVars.get(0).isSuccess, 'if isSuccess is equals to false, there was a problem regarding file generation.');


    }    

    @isTest
    private static void generateContractFileFailTest() {
        AccountContractInvocable.InputVariables fileVars = new AccountContractInvocable.InputVariables();
        fileVars.contractId = null;
        fileVars.pdfContent = 'Account Contract test';
        fileVars.pdfExtension = 'pdf';
        fileVars.pdfTitle = 'Test Contract';

        List<AccountContractInvocable.InputVariables> fileVarsLst = new List<AccountContractInvocable.InputVariables>();
        fileVarsLst.add(fileVars);

        List<AccountContractInvocable.OutputVariables> outputVars = AccountContractInvocable.generateContractPdf(fileVarsLst);

        System.assertEquals(false, outputVars.get(0).isSuccess, 'if isSuccess is equals to false, there was a problem regarding file generation.');


    }    

}