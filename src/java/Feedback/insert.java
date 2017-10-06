package Feedback;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review.Feedback;
import review.FeedbackDao;
import review.FeedbackDaoImpl;

@WebServlet(urlPatterns = "/feedback")
public class insert extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String data[]=req.getParameterValues("feed");
        
//        Connection conn=database.Database.getInstance().getConnection();
            Feedback f=new Feedback();
            FeedbackDao fdao=new FeedbackDaoImpl();
            
            for(int i=0;i<data.length;i++)
            {
                switch(i){
                    case 0: f.setName(data[i]); break;
                    case 1: f.setEmail(data[i]); break;
                    case 2: f.setFeeds(data[i]); break;
                }            
            }
            fdao.insert(f);
            resp.sendRedirect("ViewFeedback.jsp");
            System.out.println("Inserted");
    }
    
}
