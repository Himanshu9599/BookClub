package himanshu.loginregdemo.controllers;

import java.util.List;
// import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
// import org.springframework.web.bind.annotation.RequestParam;

import himanshu.loginregdemo.models.Book;
import himanshu.loginregdemo.services.BookService;
import himanshu.loginregdemo.services.UserService;

//!CREATE tells Spring that this java class will be a controller
@Controller
public class MainController {
        //! Autowired connect controllers to our service
        //! BookService = the class or data type
        //! bookService  = instance of the class
    @Autowired BookService bookService;
    @Autowired UserService userService;
    
    //! CREATE (to display the new book or create form)
    @GetMapping("/books/new")
    public String newBook(
        @ModelAttribute("book")Book book
        ){
            return "books/new.jsp";
            }

    //! this one handles form data from the method above, passes data to service
    @PostMapping("/books")
    public String createBook(
        @Valid
        @ModelAttribute("book")Book book, BindingResult results
        ){
            if(results.hasErrors()) {
                return "/books/new.jsp";
            } else {

                bookService.createBook(book);
                return "redirect:/books";
            }
    }

    //! READ ALL
    @GetMapping("/books")
    public String books (Model model, HttpSession session){
        if(session.getAttribute("userId") ==  null) {
            return "redirect:/";
        }
        // invokation of the getAllbook in the service folder
        List<Book> books = bookService.getAllBook();
        //the model send data from DB to the view
        model.addAttribute("books", books);
        return "books/home.jsp";
    }


    //! READ ONE (show.jsp)
    @GetMapping("/books/{id}")
    public String show(@PathVariable("id")Long id, Model model, HttpSession session){
        if(session.getAttribute("userId") ==  null) {
            return "redirect:/";
        }
        Book book = bookService.getOneBook(id);
        // System.out.println(book);
        //send DB to the view
        model.addAttribute("book", book);
        return "books/show.jsp";
    }

    //! UPDATE
    @GetMapping("/books/{id}/edit")
    public String update(@PathVariable("id")Long id, Model model, HttpSession session){
        if(session.getAttribute("userId") ==  null) {
            return "redirect:/";
        }
        Book book = bookService.getOneBook(id);
        model.addAttribute("book", book);
        return "books/update.jsp";
    }
        @PutMapping("/books/{id}")
        public String edit(@Valid @ModelAttribute("book")Book book, BindingResult results ){
            if(results.hasErrors()) {
                return "books/update.jsp";
            } else {

                bookService.updateBook(book);
                return "redirect:/books";
            }
            // System.out.println(book);
        }

    //! DELETE
        @DeleteMapping("/books/delete/{id}")
        public String destroy(@PathVariable("id")Long id, HttpSession session ){
            if(session.getAttribute("userId") ==  null) {
                return "redirect:/";
            }
            Book book = bookService.getOneBook(id);
            bookService.deleteBook(book);
            return "redirect:/books";
        }


    //! BORROW 
    @GetMapping("/books/{id}/borrow")
    public String borrowBook(@PathVariable("id")Long id, HttpSession session ){
        if(session.getAttribute("userId") ==  null) {
            return "redirect:/";
        }
        Book book = bookService.getOneBook(id);
        book.setBorrower(userService.findById((Long)session.getAttribute("userId")));
        bookService.updateBook(book);
        System.out.println(book.getBorrower().getId());
        return "redirect:/books";
    }

    //! RETURN
    @GetMapping("/books/{id}/return")
    public String returnBook(@PathVariable("id")Long id, HttpSession session ){
        if(session.getAttribute("userId") ==  null) {
            return "redirect:/";
        }
        Book book = bookService.getOneBook(id);
        book.setBorrower(null);
        bookService.updateBook(book);
        // System.out.println(book.getBorrower().getId());
        return "redirect:/books";
    }


}