package BusLinker.Table;

public class Owner {
    String Name, Addr, Mobile, Email;

    public Owner(String name, String addr, String mobile, String email) {
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
