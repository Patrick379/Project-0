public class ApexP0Exercises {

/*
 * 1. Return the nth Fibonacci number
 * Test Cases:
 * Input: 0     Output: 0
 * Input: 1 Output: 1
 * Input: 2     Output: 1
 * Input: 10    Output: 55
*/
    public static Integer nFibonacci( Integer n ){

        Integer result = 0;
        Integer fibn1 = 0;
        Integer fibn2 = 1;
        for(Integer i = 0; i < n; i++){
            
            result = fibn1 + fibn2;
            fibn2 = fibn1;
            fibn1 = result;
        }
        return result;
    }
    
/*
 * 2. Sort an array of integers.
 * Test Cases:
 * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
 * Input: [5,4,3,2,1]   Output: [1,2,3,4,5]
 *
 * Don't use the sort() method... that would be lame.
*/
    public static Integer[] sortArray( Integer[] intList ) {

        Integer[] result = new List<Integer>();
        Integer min = 0;
        Integer indexOfMin = 0;
        while(intList.size() > 0){
            min = intList[0];
            indexOfMin = 0;
            for( Integer index = 0; index < intList.size(); index++){
                
                if(intList[index] <= min){
                    
                    min = intList[index];
                    IndexOfMin = index;
                }
                
            }
          
            result.add(min);
            intList.remove(indexOfMin);
        }
            
        
        return result;
    }
    
/*
 * 3. Return the factorial of n.
 * Test Cases:
 * Input: 0 Output: 1
 * Input: 1 Output: 1
 * Input: 3 Output: 6
*/
public static Integer nFactorial( Integer n) {

    Integer result = 1;
    while( n > 0){
        
        result *= n;
        n--;
    }
    
    return result;
}
    
    
/*
 * 4. Rotate left
 * Given an array, array, and an integer, n, rotate the values in array left n times and return array
 * Test Cases:
 * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
*/
public static Integer[] rotateLeftNTimes( Integer[] arr, Integer n) {

    Integer turnLeft = -1;
    Integer[] resultIndex = new List<Integer>();
    Integer[] result = new List<Integer>();
    for(Integer i = 0; i < arr.size();i++){
        
        integer a = -(n+i);
        integer b = arr.size();
        integer res = Math.mod(b,a);
        system.debug('A = '+a);
        system.debug('B = '+b);
        if(res == arr.size()){
            resultIndex.add(res-1);
        }
        else{
            resultIndex.add(res);
        }
    }
    for(Integer i: resultIndex){
        
        result.add(arr[i]);
        
    }
    
    
    return result;
}
    
    /*
 * 5. Balanced Brackets
 * A bracket is any one of the following: (, ), {, }, [, or ]
 * 
 * The following are balanced brackets:
 *    ( )
 *    ( ) ( )
 *    ( ( ) )
 *    ( { [ ] } )
 *
 * The following are NOT balanced brackets:
 *   (
 *   )
 *   ( ( )
 *   ( [ ) ]
 *
 * Return true if balanced
 * Return false if not balanced
*/
public static Boolean bracketsAreBalanced( String s ) {
   
    list<string> brackets = new list<string>();
    if(s.length() == 0 || s.substring(0,1).equals( ')' )  || s.substring(0,1).equals(']')) {
        
        return false;
    }
    if(Math.mod(s.length(),2) != 0){
        return false;
    }
    for(integer i = 0; i < s.length(); i++){
        
        if(s.substring(i,i+1).equals(')')){
            if(brackets[brackets.size() -1].equals('(')){
                brackets.remove(brackets.size() -1);
            }else{
            	return false;
            }
        }
        else if(s.substring(i,i+1).equals(']')){
            if(brackets[brackets.size() -1].equals('[')){
                brackets.remove(brackets.size() -1);
            }else{
            	return false;
            }
        }else{
            brackets.add(s.substring(i,i+1));
        }
    }
    if(brackets.size() != 0){
		return true;
    }else{
        return false;
    }
}

/* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

/*
 * 6. Create a method that retrieves a list of all accounts and updates those accounts.
 *   Create a custom field on the Account standard object called Size__c that will be a 
 * picklist containing small/medium/large.
 *  Create a method that retrieves a list of all accounts. 
 *      - If an account has between 1-1000 employees then it is classified as small.
 *      - If an account has between 1001-10000 employees it is classified as medium.
*       - If an account has more than 10000 employees it is classified as large.
 *  Update the Size__c field on each account to reflect the amount of employees in the Account.
*/
public static void updateAccountSize( ) {

    List<Account> accounts =    [SELECT Name, NumberOfEmployees , Size__c FROM 
                                   Account ];   
            for(Account a: accounts){
                if(a.NumberOfEmployees <= 1000){
                    a.Size__c = 'Small';
                }
                else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees <= 10000){
                    a.Size__c = 'Medium';
                }
                else if(a.NumberOfEmployees > 10000){
                    a.Size__c = 'Large';
                }
                else{
                    a.Size__c = '';
                }
            }
        if(accounts.size() > 0){
            database.update(accounts,false);
        }
        
}

/* 
 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 *  If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */
public static void updateCALeads( ) {

    List<Lead> leads = [SELECT State FROM Lead WHERE State = 'CA'];
    for(Lead l: leads){
        
        l.Status = 'Closed - Not Converted';
        l.Description = 'We are no longer doing business in California.';
    }
    
    update(leads);
}

/*
 * 8. Create a method that will find all Opportunities which have already passed their Close Date 
 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 */
public static void closePastDueOpportunities( ) {
    
    List<Opportunity> opp =  [SELECT CloseDate, StageName FROM Opportunity  WHERE StageName != 'Closed Won'];
    List<Opportunity> toReturn = new List<Opportunity>();
    for(Opportunity o: opp){
        
        if(o.CloseDate.month() > Date.today().month()){
            o.StageName = 'Closed Lost';
            toReturn.add(o);
        }else if(o.CloseDate.month() == Date.today().month() && o.CloseDate.day() > Date.today().day()){
            o.StageName = 'Closed Lost';
            toReturn.add(o);
        }
    }
    
    update(toReturn);

}

    
}