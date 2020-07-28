public class SingletonUtility {

    private static SingletonUtility singletonInstance;
    private static String profileName;
    
    private SingletonUtility() {}
    
    public static SingletonUtility getSingletonUtility() {        
        if(null == singletonInstance) {
        System.debug('Creating new Instance for this class');
            singletonInstance = new SingletonUtility();
            setSOQLs();            
        }
        
        return singletonInstance;
    }
    
    public String getUserProfile() {        
        return profileName;
    }
    
    public static void setSOQLs() {
        Id profileId = UserInfo.getProfileId();
        profileName = [Select Id, Name from Profile where Id = :profileId].Name;
    }
}