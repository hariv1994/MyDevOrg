public class NoobChain {

    public static List<Block> blockchain = new List<Block>();

    public static void main() {
    
        /*Block block1 = new block('sarat', '0');       
        system.debug('Sarat Hash -->' + block1.hash);
        
        Block block2 = new block('valli', block1.hash);       
        system.debug('valli Hash -->' + block2.hash);
        
        Block block3 = new block('teja', block2.hash);       
        system.debug('teja Hash -->' + block3.hash);*/
        
        blockchain.add(new Block('Hi im the first block', '0'));        
        blockchain.add(new Block('Yo im the second block',blockchain.get(blockchain.size()-1).hash)); 
        blockchain.add(new Block('Hey im the third block',blockchain.get(blockchain.size()-1).hash));
        
        System.debug(Json.serialize(blockchain));
    }

    
}