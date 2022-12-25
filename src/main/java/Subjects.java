import Annotations.Column;
import Annotations.Table;

@Table("subject")
public class Subjects {
    @Column(name = "Id")
    private int ID;

    @Column(name = "Name")
    private String Name;

}
