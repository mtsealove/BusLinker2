package BusLinker.Table;

public class Company {
    String BusinessName, BusinessAddr, Mobile, Email;

    public Company(String businessName, String businessAddr, String mobile, String email) {
        BusinessName = businessName;
        BusinessAddr = businessAddr;
        Mobile = mobile;
        Email = email;
    }

    public String getBusinessName() {
        return BusinessName;
    }

    public String getBusinessAddr() {
        return BusinessAddr;
    }

    public String getMobile() {
        return Mobile;
    }

    public String getEmail() {
        return Email;
    }
}
