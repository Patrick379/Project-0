public class Banker {

     public Banker(){


    }
    //Check if an account is overdrawn and change the status of the account accordingly.
    public static void changeStatus(){

        List<BankAccount__c> accounts = [SELECT Name, Balance__c, Status__c FROM BankAccount__c];
        List<BankAccount__c> accountsToChange = new List<BankAccount__c>();
        for(BankAccount__c a : accounts){

            if(a.Balance__c < 0){
            
                BankAccount__c acc = a;
                acc.Status__c = 'Overdrawn';
                accountsToChange.add(acc);
            }
            else{
                BankAccount__c acc = a;
                a.Status__c = 'Not Ovedrawn';
                accountsToChange.add(acc);
            }
        }
        update(accountsToChange);
    }
    
    //Create a new transaction relating to the account.
    public static void createTransaction(String accName, Double amount){
        
        BankAccount__c acc = [SELECT Name FROM BankAccount__c WHERE Name = :accName];
        AccountTransaction__c trans = new AccountTransaction__c();
        trans.Amount__c = amount;
        trans.Account__r = acc;
        insert(trans);
    }
    
    //Update the account based on all related transactions to show current balance.
    public static void updateAccount(String accName){
        
        BankAccount__c acc = [SELECT Name FROM BankAccount__c WHERE Name = :accName];
        List<AccountTransaction__c> transactions =[SELECT Id, Account__c FROM AccountTransaction__c WHERE Account__r.Name = :accName];
        for(AccountTransaction__c trans: transactions){
            
            acc.Balance__c += trans.Amount__c;
        }
        update(acc);
    }
}