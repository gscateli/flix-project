public with sharing class FileGenerator {

    public static Boolean generateFile(String fileContent, String fileTitle, String fileExtension, String recordId) {
        try {
            String pdfContent = fileContent; // pass as parameter
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S';
            cVersion.Title = fileTitle; //pass as parameter the contract number 
            cVersion.PathOnClient = cVersion.Title + '.' + fileExtension;
            cVersion.VersionData = Blob.toPdf(pdfcontent);
    
            insert cVersion;
    
    
            Id conDocument = [SELECT ContentDocumentId 
                              FROM ContentVersion 
                              WHERE Id =:cVersion.Id
                              WITH SECURITY_ENFORCED].ContentDocumentId;
    
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;
            cDocLink.LinkedEntityId = recordId; //pass the contract id as a parameter
            cDocLink.Visibility = 'AllUsers';
            cDocLink.ShareType = 'V';
    
            insert cDocLink;    
        } catch(Exception e) {
            return false;
        }

        return true;
    }
}