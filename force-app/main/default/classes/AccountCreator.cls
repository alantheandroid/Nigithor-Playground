public class AccountCreator {
    public static void createAccount() {
        Account acc = new Account(Name='Test');
        System.debug(acc);
        insert acc;
    }
}