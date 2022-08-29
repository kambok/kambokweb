
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Finance;


public class RedeemLoan extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pin = request.getParameter("payment_pin");
            
            List<Finance> fc = data.Database.saveLoanRedeem(pin);
            if(!fc.isEmpty()){
                out.println("<style>");
                    out.println(".report-card{background: url(bg.png); background-size: cover; background-repeat: no-repeat; width: 100%; transition: all 0.5s ease;"
                            + "border-radius: 30px; box-shadow: 0 0 24px rgba(0,0,0,0.2);}"
                            + ".icon{border-radius: 50%; background-color:#8cd9e530; padding: 10px; height: 100%; width: 100%;}"
                            + ".extra{border-radius: 30px; box-shadow: 0 0 24px rgba(0,0,0,0.2); }");
                out.println("</style>");
                for(Finance pay:fc){
                    if(pay.getPmtpin().equals(pin)){
                        out.println("<div class='p-5 d-flex justify-content-center align-items-center'>");
                            out.println("<div class='report-card text-center text-info p-3'>");
                                out.println("<p class='text-left text-light'><span class='icon'><i class='fa-solid fa-calendar-check mx-2'></i></span>Payment Confirmation</p>");
                                out.println("<h4 class='text-center text-light mt-4'>Payment has been received</h3>");
                                out.println("<br>");
                                out.println("<form action='redeemloan.jsp'><input type='hidden' value='"+pay.getTrid()+"' name='trid'> "
                                        + "<input type='hidden' value='"+pay.getAgentname()+"' name='agentname'> "
                                        + "<input type='hidden' value='"+pay.getAgentid()+"' name='agentid'> "
                                        + "<input type='hidden' value='"+pay.getDate()+"' name='pdate'> "
                                        + "<input type='hidden' value='"+pay.getReceivedsection()+"' name='receivedsection'> "
                                        + "<input type='hidden' value='"+pay.getPmtpin()+"' name='paymentpin'> "
                                        + "<input type='hidden' value='"+pay.getSendemail()+"' name='senderemail'> "
                                        + "<input type='hidden' value='"+pay.getSendername()+"' name='sendername'> "
                                        + "<input type='hidden' value='"+pay.getTime()+"' name='ptime'> "
                                        + "<input type='hidden' value='"+pay.getDeposit()+"' name='amount'>"
                                        + "<input type='hidden' value='"+pay.getStatus()+"' name='status'> "
                                        + "<input type='hidden' value='"+pay.getBalance()+"' name='balance'> "
                                        + "<input type='hidden' value='"+pay.getPmtmethd()+"' name='pmethod'> "
                                        + "<button type='submit' class='btn btn-info extra'>Proceed to redeem loan</button></form>");
                                out.println("</div>");
                        out.println("</div>");
                    }else if(pay.getTrid().equals(pin)){
                        out.println("<div class='p-5 d-flex justify-content-center align-items-center'>");
                            out.println("<div class='report-card text-center text-info p-3'>");
                                out.println("<p class='text-left text-light'><span class='icon'><i class='fa-solid fa-calendar-check mx-2'></i></span>Payment Confirmation</p>");
                                out.println("<h4 class='text-center text-light mt-4'>Payment has been received</h3>");
                                out.println("<br>");
                                out.println("<form action='redeemloan.jsp'><input type='hidden' value='"+pay.getTrid()+"' name='trid'> "
                                        + "<input type='hidden' value='"+pay.getAgentname()+"' name='agentname'> "
                                        + "<input type='hidden' value='"+pay.getAgentid()+"' name='agentid'> "
                                        + "<input type='hidden' value='"+pay.getDate()+"' name='pdate'> "
                                        + "<input type='hidden' value='"+pay.getReceivedsection()+"' name='receivedsection'> "
                                        + "<input type='hidden' value='"+pay.getPmtpin()+"' name='paymentpin'> "
                                        + "<input type='hidden' value='"+pay.getSendemail()+"' name='senderemail'> "
                                        + "<input type='hidden' value='"+pay.getSendername()+"' name='sendername'> "
                                        + "<input type='hidden' value='"+pay.getTime()+"' name='ptime'> "
                                        + "<input type='hidden' value='"+pay.getDeposit()+"' name='amount'>"
                                        + "<input type='hidden' value='"+pay.getStatus()+"' name='status'> "
                                        + "<input type='hidden' value='"+pay.getBalance()+"' name='balance'> "
                                        + "<input type='hidden' value='"+pay.getPmtmethd()+"' name='pmethod'> "
                                        + "<button type='submit' class='btn btn-info extra'>Proceed to redeem loan</button></form>");
                                out.println("</div>");
                        out.println("</div>");
                    }else{
                        out.println("<h3 class='text-center text-danger'>Incorrect pin or transaction id</h3>");
                    }
                }
            }else{
                out.println("<h3 class='text-center text-danger'>Incorrect pin or transaction id</h3>");
            }
        }
    }

}
