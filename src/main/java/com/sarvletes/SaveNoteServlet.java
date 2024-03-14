
package com.sarvletes;


import com.entities.*;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class SaveNoteServlet extends HttpServlet {
    public SaveNoteServlet(){
        super();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException, IOException {

    try {

      String title=req.getParameter("title");
      String content=req.getParameter("content");

      Note note = new Note(title,content,new Date());

        //System.out.println(note.getId()+" "+note.getTitle());
        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();
        s.save(note);
        tx.commit();

        s.close();

        resp.setContentType("text/html");
        PrintWriter out= resp.getWriter();
        out.println("<h1 style = 'text-align:center;'>not is added Success  servleth2</h1>");
        out.println("<h1 style = 'text-align:center;'><a href ='all_notes.jsp'>View all</a></h1>");
    }catch (Exception e){

    }


        //       resp.setContentType("text/html");
//      PrintWriter out= resp.getWriter();
//
//      out.println("<h2> this is Success  servleth2</h2>");
//      out.println(" this is Success  servleth2");
    }


}

