package BusLinker.Route;

public class Route {
    String Alias, Center, Bus, Addr;

    public Route(String alias, String center, String bus, String addr) {
        Alias = alias;
        Center = center;
        Bus = bus;
        Addr = addr;
    }

    public String getAlias() {
        return Alias;
    }

    public String getCenter() {
        return Center;
    }

    public String getBus() {
        return Bus;
    }

    public String getAddr() {
        return Addr;
    }

    @Override
    public String toString() {
        return "Route{" +
                "Alias='" + Alias + '\'' +
                ", Center='" + Center + '\'' +
                ", Bus='" + Bus + '\'' +
                ", Addr='" + Addr + '\'' +
                '}';
    }
}
