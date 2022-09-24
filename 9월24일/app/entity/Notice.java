package jdbc.app.entity;

public class Notice {
    private String id;
    private String title;
    private int min;
    private int max;

    public Notice(){
        this("","",0,0);
    }
    public Notice(String id, String title, int min, int max) {
        this.id = id;
        this.title = title;
        this.min = min;
        this.max = max;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }
}
