package BusLinker;

public class Notice {
    int NoticeID;
    String MemberID, Title, Content, FilePath, NoticeTime;

    public Notice(int noticeID, String memberID, String title, String content, String filePath, String noticeTime) {
        NoticeID = noticeID;
        MemberID = memberID;
        Title = title;
        Content = content;
        FilePath = filePath;
        NoticeTime = noticeTime;
    }

    public String getMemberID() {
        return MemberID;
    }

    public String getTitle() {
        return Title;
    }

    public String getContent() {
        return Content;
    }

    public String getFilePath() {
        return FilePath;
    }

    public String getNoticeTime() {
        return NoticeTime;
    }

    public int getNoticeID() {
        return NoticeID;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "NoticeID=" + NoticeID +
                ", MemberID='" + MemberID + '\'' +
                ", Title='" + Title + '\'' +
                ", Content='" + Content + '\'' +
                ", FilePath='" + FilePath + '\'' +
                ", NoticeTime='" + NoticeTime + '\'' +
                '}';
    }
}
