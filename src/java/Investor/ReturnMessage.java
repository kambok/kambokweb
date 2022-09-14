package Investor;

import static Investor.InvestorInterestReturn.cd;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.InvestorDetails;
import model.Message;

public class ReturnMessage extends HttpServlet {

    static String investId, walletId, interestDate, investDate, status, returnDate, today, compareDate, msgInvestmentId, msgStatus;
    static double interest, amount, totalAmount, walletBal, credit, returnAmount, debit;
    static int cd, cm, cy, lm, investMonth, investDay, investYear, interestDay, interestMonth, interestYear, modDate, newDay, count;

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            LocalDate date = LocalDate.now();
            cd = date.getDayOfMonth();
            cm = date.getMonthValue();
            cy = date.getYear();
            lm = date.lengthOfMonth();
            today = cy + "-" + cm + "-" + cd;
            List<InvestorDetails> invest = data.Database.getInvestmentId(email);
            for (InvestorDetails id : invest) {
                investId = id.getInvestmentID();
                List<InvestorDetails> investRecord = data.Database.
                        getInvestmentRecord(investId);
                for (InvestorDetails ir : investRecord) {
                    amount = ir.getInvestmentHistory();
                    interest = ir.getInterest();
                    interestDay = ir.getDays();
                    interestMonth = ir.getMonth();
                    interestYear = ir.getYear();
                    walletId = ir.getWalletId();
                    interestDate = ir.getDate();
                    walletBal = ir.getWalletBalance();
                    returnDate = ir.getReturnDate();
                    debit = ir.getDebit();
                    status = ir.getStatus();
                    compareDate = interestYear + "-" + interestMonth + "-"
                            + interestDay;
                    SimpleDateFormat sdformat = new SimpleDateFormat(
                            "yyyy-MM-dd");
                    Date d1 = sdformat.parse(today);
                    Date d2 = sdformat.parse(compareDate);

                    if (status.equals("Liquidated")) {
                        if (d1.compareTo(d2) > 0 || d1.compareTo(d2) == 0) {
                            Message message = new Message();
                            message.setEmail(email);
                            message.setInvestmentId(investId);
                            message.setMessageId(MessageId.messageID());
                            message.setStatus("Unread");

                            if (data.Database.message(message) == 1) {
                            }
                        }
                    }
                    break;
                }
            }
            List<Message> messag = data.Database.getMessage(email);
            for (Message msg : messag) {
                msgStatus = msg.getStatus();
                if (msgStatus.equals("Unread")) {
                    count += 1;
                }
            }
            if (count != 0) {
                out.println(count);
                count = 0;
            }
        } catch (Exception e) {
        }
    }
}
