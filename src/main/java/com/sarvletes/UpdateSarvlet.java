package com.sarvletes;

import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


public class UpdateSarvlet extends HttpServlet {
    public UpdateSarvlet(){
        super();
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, IOException {

        try {
            String title=req.getParameter("title");
            String content=req.getParameter("content");
            int noteId=Integer.parseInt(req.getParameter("noteId").trim());


            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            Note note= s.get(Note.class,noteId);
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            tx.commit();
            s.close();

            resp.sendRedirect("all_notes.jsp");

        } catch (Exception e) {

        }
    }
}
