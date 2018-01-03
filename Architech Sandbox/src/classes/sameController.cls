public with sharing class sameController {

        public string datevalue {get;set;}
        public sameController(){
            datevalue = string.valueof(System.today());
        }


        public PageReference call(){
                PageReference page = new PageReference('/apex/TestSameController1?date'+datevalue);
                return page;
        }
}