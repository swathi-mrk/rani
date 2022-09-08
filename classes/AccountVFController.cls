public class AccountVFController {
    public Id acid {set;get;}
    public Id cid {set;get;}
    public List<SelectOption> getOptions()
    {
        List<SelectOption> accList = new
            List<SelectOption>();
        accList.add(new SelectOption('--select--','--SelectAccount--'));
        List<Account> accs = [select name ,id from account];
        for(Account ac : accs){
            accList.add(new SelectOption(ac.id,ac.name));
        }
        return accList;
    }
    public List<SelectOption> getOpt()
    {
        List<SelectOption> accList = new List<SelectOption>();
        accList.add(new SelectOption('--select--','--SelectRealted Contact--'));
        List<Contact> accs = [select name ,id from Contact
                              where AccountId = :acid];
        for(Contact ac : accs){
            accList.add(new SelectOption(ac.id,ac.name));
        }
        return accList;
    }
    public List<Account> getAccs()
    {
        return [select name,website,rating,ownership from
                account where id = :acid];
    }
    public List<Contact> getCons()
    {
        return [select name,Email , AccountId from Contact where id = :cid];
    }

}