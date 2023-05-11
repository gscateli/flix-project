public with sharing class AccountContractInvocable {

    @InvocableMethod(label='Generate Contract PDF' description='Generate contract\'s PDF')
    public static List<OutputVariables> generateContractPdf(List<InputVariables> inputVariables) {
        String pdfContent = inputVariables.get(0).pdfContent;
        String pdfTitle = inputVariables.get(0).pdfTitle;
        String pdfExtension = inputVariables.get(0).pdfExtension;
        String contractId = inputVariables.get(0).contractId;

        List<OutputVariables> outputVarList = new List<OutputVariables>();
        OutputVariables outputVars = new OutputVariables();

        outputVars.isSuccess = FileGenerator.generateFile(pdfContent, pdfTitle, pdfExtension, contractId);
        outputVarList.add(outputVars);

        return outputVarList;
    }

    public class InputVariables {
        @InvocableVariable(required=true)
        public String pdfContent;

        @InvocableVariable(required=true)
        public String pdfTitle;

        @InvocableVariable(required=true)
        public String pdfExtension;

        @InvocableVariable(required=true)
        public String contractId;

    }

    public class OutputVariables {
        @InvocableVariable
        public Boolean isSuccess;
    }
}