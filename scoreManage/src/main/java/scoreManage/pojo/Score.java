package scoreManage.pojo;

import lombok.Data;

@Data
public class Score {

    private String id;
    private String name;
    private int mathScore;
    private int englishScore;
    private int programScore;
    private int databaseScore;

    public double getSumScore() {
        return this.mathScore + this.englishScore + this.programScore + this.databaseScore;
    }

    public double getAverageScore() {
        return (double) (this.mathScore + this.englishScore + this.programScore + this.databaseScore) / 4;
    }
}
