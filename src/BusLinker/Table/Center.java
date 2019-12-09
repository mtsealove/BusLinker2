package BusLinker.Table;

public class Center {
    String BusinessName, BusinessNum, BusinessAddr, CenterAddr, Contact, ID;

    public Center(String businessName, String businessNum, String businessAddr, String centerAddr, String contact, String ID) {
        BusinessName = businessName;
        BusinessNum = businessNum;
        BusinessAddr = businessAddr;
        CenterAddr = centerAddr;
        Contact = contact;
        this.ID = ID;
    }

    public String getBusinessName() {
        return BusinessName;
    }

    public void setBusinessName(String businessName) {
        BusinessName = businessName;
    }

    public String getBusinessNum() {
        return BusinessNum;
    }

    public void setBusinessNum(String businessNum) {
        BusinessNum = businessNum;
    }

    public String getBusinessAddr() {
        return BusinessAddr;
    }

    public void setBusinessAddr(String businessAddr) {
        BusinessAddr = businessAddr;
    }

    public String getCenterAddr() {
        return CenterAddr;
    }

    public void setCenterAddr(String centerAddr) {
        CenterAddr = centerAddr;
    }

    public String getContact() {
        return Contact;
    }

    public void setContact(String contact) {
        Contact = contact;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }
}
