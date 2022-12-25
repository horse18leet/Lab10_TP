import Annotations.Column;
import Annotations.Table;

@Table("progress")
public class Progress {
    //id, студент, предмет, оценка
    @Column(name = "id")
    private int ID;

    @Column(name = "id_student")
    private int IDStudent;

    @Column(name = "id_subject")
    private int IDSubject;

    @Column(name = "mark")
    private byte Mark;

}
