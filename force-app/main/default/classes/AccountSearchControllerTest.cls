@isTest
public class AccountSearchControllerTest {
    
    @isTest
    static void testSearchAccounts() {
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0; i<5; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            testAccounts.add(acc);
        }
        insert testAccounts;

        Test.startTest();
            List<Account> accts = AccountSearchController.searchAccounts('Test');
            System.assertNotEquals(null, accts, 'Accounts should be present');
            System.assertEquals(true, accts.size()>0);
        Test.stopTest();
    }
}
