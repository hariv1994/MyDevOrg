public class StringUtil {

    public static String applySHA(String input) {
    
        try {
            String message = EncodingUtil.convertToHex(Crypto.generateDigest('SHA1',Blob.valueOf(input)));
            return message;
        }
        catch (Exception e) {
            System.debug(e.getMessage());
        }
        return null;
    }
}