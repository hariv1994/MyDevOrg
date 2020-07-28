public class Block {

    public String hash;
    public String previousHash;
    private String data;
    private Long timestamp;
    
    public Block(String data, String previousHash) {
        this.previousHash = previousHash;
        this.data = data;
        this.timestamp = System.now().gettime(); 
        this.hash = calculateHash();
    }
    
    public String calculateHash() {
        String calculatedHash = StringUtil.applySHA(
            previousHash + 
            timestamp + 
            data
        );
        
        return calculatedHash;
    }
}