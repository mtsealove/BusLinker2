package BusLinker.Table;

public class Staff {
    String Name, Addr, Mobile, Email;

    public Staff(String name, String addr, String mobile, String email) {
        Name = name;
        Addr = addr;
        Mobile = mobile;
        Email = email;
    }

    public String getName() {
        return Name;
    }

    public String getAddr() {
        return Addr;
    }

    public String getMobile() {
        return Mobile;
    }

    public String getEmail() {
        return Email;
    }
}
