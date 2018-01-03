@isTest
global class ParkLocatorTest {
   @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        string country = 'INDIA';
        List<string> parks = ParkLocator.country('INDIA');
        
    }
    
}