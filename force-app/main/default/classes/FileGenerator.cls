public with sharing class FileGenerator {

    public static Boolean generateFile(String fileContent, String fileTitle, String fileExtension, String recordId) {
        try {
            String pdfContent = fileContent; 
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S';
            cVersion.Title = fileTitle; 
            cVersion.PathOnClient = cVersion.Title + '.' + fileExtension;
            cVersion.VersionData = Blob.toPdf(pdfcontent);
    
            insert cVersion;
    
    
            Id conDocument = [SELECT ContentDocumentId 
                              FROM ContentVersion 
                              WHERE Id =:cVersion.Id
                              WITH SECURITY_ENFORCED].ContentDocumentId;
    
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;
            cDocLink.LinkedEntityId = recordId; 
            cDocLink.Visibility = 'AllUsers';
            cDocLink.ShareType = 'V';
    
            insert cDocLink;    
        } catch(Exception e) {
            return false;
        }

        return true;
    }
}