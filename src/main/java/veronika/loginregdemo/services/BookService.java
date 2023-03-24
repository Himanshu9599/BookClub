package veronika.loginregdemo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import veronika.loginregdemo.models.Book;
import veronika.loginregdemo.repositories.BookRepository;


@Service
public class BookService {
    //BookRepository is object (capital B)
    @Autowired BookRepository bookRepository;

    //!CREATE
    public void createBook(Book book) {
        bookRepository.save(book);
    }

    //!READ ALL
    public List<Book> getAllBook() {
        return bookRepository.findAll();
    }

    //!READ ONE
    public Book getOneBook(Long id){
        Optional<Book> optionalbook = bookRepository.findById(id);
        Book book = optionalbook.orElse(null);
        return book;
    }
    //!UPDATE
    public void updateBook (Book book) {
        bookRepository.save(book);
    }

    //!DELETE
    public void deleteBook(Book book) {
        bookRepository.delete(book);
    } 

}