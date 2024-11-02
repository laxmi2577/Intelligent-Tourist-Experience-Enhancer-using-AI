/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/Tweets")
@MultipartConfig(maxFileSize = 16177215)
public class Tweets extends HttpServlet {

    private SimpleDateFormat format;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException, Exception {
        try {
            HttpSession session = request.getSession(true);
            String userid = (String) session.getAttribute("uid");
            String uname = (String) session.getAttribute("uname");
            String msg = request.getParameter("msg");
            session.setAttribute("message", msg);
            InputStream inputStream = null;
            Part filePart = request.getPart("file");
            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("current Date " + time);

            Pattern MY_PATTERN = Pattern.compile("#(\\S+)");
            Matcher mat = MY_PATTERN.matcher(msg);
            List<String> strs = new ArrayList<String>();
            while (mat.find()) {
                //System.out.println(mat.group(1));
                strs.add(mat.group(1));
            }
            String list = Arrays.toString(strs.toArray()).replace("[", "").replace("]", "");
            
            Sentiment s = new Sentiment();
            float score = s.findSentiment(msg.trim());

            String temp = "";
            double poscount = 0, negcount = 0, undefined = 0, neutralcount = 0;
            if (score >= 1) {
                poscount++;
                temp = "Positive";
            }
            if (score < 0) {
                negcount++;
                temp = "Negative";
            }
            if (score >= 0 && score < 1) {
                neutralcount++;
                temp = "Neutral";
            }

            Connection conn = SQLconnection.getconnection();

            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();
            String sql = "INSERT INTO tweet (uid, username, msg, photo, time, sentiment, score,hashtag) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, uname);
            statement.setString(3, msg);

            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }
            statement.setString(5, time);
            statement.setString(6, temp);
            statement.setFloat(7, score);
            statement.setString(8, list);
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("tweet.jsp?Success");
            } else {
                response.sendRedirect("tweet.jsp?Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Tweets.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Tweets.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
