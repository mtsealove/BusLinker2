package BusLinker;


import org.json.simple.JSONObject;

public class Member {
    String ID, Name, Boss;
    int ClassID;

    public Member(String ID, String name, String boss, int classID) {
        this.ID = ID;
        Name = name;
        Boss = boss;
        ClassID = classID;
    }

    public Member() {
    }

    public String getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getBoss() {
        return Boss;
    }

    public int getClassID() {
        return ClassID;
    }

    @Override
    public String toString() {
        return "{" +
                "ID:'" + ID + '\'' +
                ", Name:'" + Name + '\'' +
                ", Boss:'" + Boss + '\'' +
                ", ClassID:" + ClassID +
                '}';
    }

    //json 형태로 반환
    public JSONObject toJson() {
        JSONObject obj = new JSONObject();
        obj.put("ID", ID);
        obj.put("Name", Name);
        obj.put("Boss", Boss);
        obj.put("ClassID", ClassID);
        return obj;
    }
}
