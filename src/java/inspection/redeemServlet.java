/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.Redeem;


public class redeemServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String trid = request.getParameter("trid");
            String agentname = request.getParameter("agentname");
            String agentemail = request.getParameter("agentemail");
            String ownername = request.getParameter("ownername");
            String owneremail = request.getParameter("owneremail");
            String date = request.getParameter("redeemdate");
            String amt = request.getParameter("amount");
            String bal = request.getParameter("balance");
            String pmptpin = request.getParameter("pmtpin");
            String pmtagent = request.getParameter("pmtagent");
            String pmtagentID = request.getParameter("pmtagentID");
            String pmtdate = request.getParameter("pmtdate");
            float amount = parseFloat(amt);
            float balance = parseFloat(bal);
            
            Redeem r = new Redeem();
            r.setTrid(trid);
            r.setAgentname(agentname);
            r.setAgentemail(agentemail);
            r.setItemowner(ownername);
            r.setOwneremail(owneremail);
            r.setRedeemdate(date);
            r.setReceiptNo(RedeemReceiptCodegenerator.generateReceiptno());
            r.setAmount(amount);
            r.setBalance(balance);
            r.setPmtagent(pmtagent);
            r.setPmtagentid(pmtagentID);
            r.setPmtid(pmptpin);
            r.setPmtdate(pmtdate);
            
            if(data.Database.saveRedeem(r)==3){
                HttpSession session = request.getSession();
                session.setAttribute("info", trid);
                response.sendRedirect("redeem receipt.jsp");
            }else{
                out.println("Something went wrong");
            }
            
        }
    }
}
