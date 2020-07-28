@isTest
public class CalculatorCalloutMock implements WebServiceMock {
   public void doInvoke(
       Object stub,
       Object request,
       Map<String, Object> response,
       String endpoint,
       String soapAction,
       String requestName,
       String responseNS,
       String responseName,
       String responseType) {

        calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
        response_x.return_x = 11.0;

        response.put('response_x',response_x);
   }
}