package veronika.loginregdemo.models;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
// import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

// import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name="books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // private String title;
    // private String author;
    // private String thoughts;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "borrower_id")
    private User borrower;
    
    
    @NotNull(message= "Title Required")
    @Size(min=3, max=100, message = "Title need name")
    private String title;
    
    @NotNull
    @Size(min=2, max=20, message = "Author is  Required")
    private String author;


    @NotNull(message= "Thoughts By is  Required")
    @Size(min=3, max=245, message = "Must be at least 3 characters")
    private String thoughts;


    public Book() {
    }

    public Book(String title, String author, String thoughts) {
        this.title = title;
        this.author = author;
        this.thoughts = thoughts;
    }


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThoughts() {
        return this.thoughts;
    }

    public void setThoughts(String thoughts) {
        this.thoughts = thoughts;
    }


    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public User getBorrower() {
        return this.borrower;
    }

    public void setBorrower(User borrower) {
        this.borrower = borrower;
    }

    public void update(Book book) {
    }

    
}
