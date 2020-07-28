@isTest
public class AnimalLocatorMock implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;

    public AnimalLocatorMock(Integer code, String status, String body, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public AnimalLocatorMock() {
        this.code = 200;
        this.status = 'OK';
        this.body = '{"animal":{"id":1,"name":"chicken - sarat","eats":"chicken food","says":"cluck cluck"}}';
        Map<String,String> testHeader = new Map<String,String>();
        testHeader.put('Content-Type','application/json');
        this.responseHeaders = testHeader;
    }

    public HTTPResponse respond(HTTPRequest req) {

        HttpResponse res = new HttpResponse();
        for (String key : this.responseHeaders.keySet()) {
            res.setHeader(key, this.responseHeaders.get(key));
        }
        res.setBody(this.body);
        res.setStatusCode(this.code);
        res.setStatus(this.status);
        return res;
    }

}