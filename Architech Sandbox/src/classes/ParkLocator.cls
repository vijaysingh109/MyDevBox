public class ParkLocator{

        
        public static List<string> country(string countryName){
            ParkService.ParksImplPort objectParks = new ParkService.ParksImplPort();
            list<string> returnCountries = objectParks.byCountry(countryName);
            return returnCountries ;
        }
        
}