import Annotations.Column;
import Annotations.Table;

@Table("Student")
public class Student {
    // ���, ����� ��������, ����� ��������
    @Column(name = "id")
    private int Id;

    @Column(name = "name")
    private String Name;

    @Column(name = "serial")
    private Short Serial;

    @Column(name = "number")
    private int Number;
}
