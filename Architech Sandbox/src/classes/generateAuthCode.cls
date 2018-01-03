public class generateAuthCode {

    public string code {get;set;}
    public string newcode {get;set;}
    public string sessionId {get;set;}
    public void geneAuthCode(){
    
         Http h = new Http();
         //string body = '{"UserId": "PK1234","ApplicationFormNumber": "TestPramod","RegionId": "HO","ParentCompany": "EDD","ProductId": "Dummy1","FirstName": "Pramod","DateOfBirth": "14-Mar-1957","Nationality": "IND","ScreeningCategory": "OnBoarding"}';
        // string body = '{"UserId":"PK1234","ApplicationFormNumber":"Test22","BranchName":"","RegionId":"HO","SystemName":"","ParentCompany":"EDD","ProductId":"Dummy1","FirstName":"Dattatray walunj","MiddleName":"","LastName":"","PAN":"","DIN":"","CIN":"","DateOfBirth":"14-Mar-1957","Nationality":"IND","Passport":"","CorrespondenceAddress1":"","CorrespondenceAddress2":"","CorrespondenceAddress3":"","CorrespondenceAddressCity":"","CorrespondenceAddressState":"","CorrespondenceAddressCountry":"","CorrespondenceAddressPin":"","PermanentAddress1":null,"PermanentAddress2":null,"PermanentAddress3":null,"PermanentAddressCity":"null","PermanentAddressState":null,"PermanentAddressCountry":null,"PermanentAddressPin":null,"ScreeningCategory":"OnBoarding"}';
        //string body = '{"UserId":"PK1234","ApplicationFormNumber":"0035D000001Zw5TQAS","BranchName":"","RegionId":"HO","SystemName":"","ParentCompany":"ECL Finance Ltd","ProductId":"SALESFORCE","FirstName":"Dushyant Singh","MiddleName":"","LastName":"","PAN":"ASG0192","DIN":"DIN","CIN":"CIN","DateOfBirth":"14-Mar-1957","Nationality":"IND","Passport":"Test","CorrespondenceAddress1":"Permanent Address1","CorrespondenceAddress2":"Address2","CorrespondenceAddress3":"Address3","CorrespondenceAddressCity":"Address City","CorrespondenceAddressState":"UP","CorrespondenceAddressCountry":"Address Country","CorrespondenceAddressPin":"898989","PermanentAddress1":"Permanent Address1","PermanentAddress2":"Permanent Address2","PermanentAddress3":"Permanent Address3","PermanentAddressCity":"Permanent Address City","PermanentAddressState":"UP","PermanentAddressCountry":"Permanent Address Country","PermanentAddressPin":"8776787","ScreeningCategory":"OnBoarding"}';
        //string body =  '{"UserId":"PK1234","ApplicationFormNumber":"Test22","BranchName":"","RegionId":"HO","SystemName":"","ParentCompany":"ECL Finance Ltd","ProductId":"Dummy1","FirstName":"Dushyant Singh","PAN":"","DIN":"","CIN":"","DateOfBirth":"14-Mar-1957","Nationality":"IND","Passport":"","CorrespondenceAddress1":"","CorrespondenceAddress2":"","CorrespondenceAddress3":"","CorrespondenceAddressCity":"","CorrespondenceAddressState":"","CorrespondenceAddressCountry":"","CorrespondenceAddressPin":"","PermanentAddress1":null,"PermanentAddress2":null,"PermanentAddress3":null,"PermanentAddressCity":null,"PermanentAddressState":null,"PermanentAddressCountry":null,"PermanentAddressPin":null,"ScreeningCategory":"OnBoarding"}';
        string body = '';
        HttpRequest req = new HttpRequest();
         req.setTimeout(120000);
         req.setEndpoint('https://edelweissfin-reap--dev1.cs72.my.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG910YPh8zrcR1MY.tG.ZwY7EgCydCXKq25yqbHQyJnKsfM8g3i7Rc_DPvpK7zNfH8ke3jyfpIsqUfECaaN&redirect_uri=https://www.google.com');
         req.setMethod('POST');
         //req.setHeader('content-type', 'application/json');  
         //req.setHeader('Accept', 'application/json'); 
         //req.setHeader('cont','application/json'); 
         //req.setHeader('Authorization', authorizationHeader); 
         
         //req.setBody(body);
         HttpResponse res = h.send(req);
         system.debug('res------&&&&&&&&&&&&&&&-'+res.getbody());
         System.debug('&&&&&&&&'+res.getHeader('Location'));
         req.setEndpoint(res.getHeader('Location'));
         res = new Http().send(req);
         code = res.getbody();    
        sessionId  = UserInfo.getSessionId();
    }

    public static integer count {get;set;}

}