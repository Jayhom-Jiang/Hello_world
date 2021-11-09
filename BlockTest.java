public class BlockTest {
    public static void main(String[] args) {
        String desc = Person.desc;
        Person p1 = new Person();

    }
}

class Person{
    //属性
    String name;
    int age;
    static String desc = "我是一个人";
    //构造器
    public  Person(){

    }

    public  Person(String name,int age){
        this.name = name;
        this.age = age;
    }
    //代码块
    //随着类的加载而执行 只执行一次
    static {
        System.out.println("hello, static block");
    }
    //随着对象的创建而执行
    {
        System.out.println("hello, block");
    }
    //方法
    public void eat(){
        System.out.println("吃饭");
    }

    public String toString(){
        return "Person[name= "+name + ",age = "+age+"]";
    }
    public static void info(){
        System.out.println("我是一个快乐的人");
    }
}
