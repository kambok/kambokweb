<%@page import="model.DataSupply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Loan Agreement</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
 <title>View</title>
  <style>
  
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100;
  padding: 90px 0 0;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
  z-index: 99;
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 11.5rem;
    padding: 0;
  }
}

.navbar {
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
}

@media (min-width: 767.98px) {
  .navbar {
    top: 0;
    position: sticky;
    z-index: 999;
  }
}

.sidebar .nav-link {
  color: #333;
}

.sidebar .nav-link.active {
  color: #0d6efd;
}

i{
  font-size: 1.3rem;
  text-align: left;
}

.nav-item a{
  transition: .5s ease;
  text-align: left;
}

.nav-item a:hover{
  color: #0d6efd;
}

.image-container{
    object-fit: cover;
    width: 100%;
    height: 380px;
    overflow: hidden;
}

.image-container img{
    max-width: 180px;
}

p{
    font-size: 12px;
}

.watermark:before{
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    background-image: url(kam.png);
    background-position: center;
    background-repeat: no-repeat;
    background-size: 500px;
    width: 100%;
    height: 100%;
    opacity: .18;
}
  
  </style>
   
  
</head>
<body id="body">
    <%
            DataSupply ds = (DataSupply)session.getAttribute("user");
    %>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="container-fluid p-3">
                <a class="btn btn-success" href="dashboard.jsp">dashboard</a>
                <div id="data">
                <div class="card p-4 watermark">
                    <h2 class="card-header text-center" style="border-bottom: 2px solid #000; font-size: 2.5rem;">LOAN AGREEMENT</h2>
                    <br>
                    <div class="card-body p-7" style="border: 2px solid #000; border-radius: 8px;">
                        <p id="pp"><b>This Loan Agreement is made on <b><%=ds.getLoandate()%></b>&nbsp; with ref <u><%=ds.getTrid()%></u> &nbsp;and Between <b><%=ds.getFirstname() %></b> &nbsp;<b><%=ds.getLastname()%></b>&nbsp;as the ("Borrower"), and Kambok info-tech located at 1,osla junction,phase 2, Gwagwalada, Abuja. (“Lender”).</b> 
<br />
<big><b>The parties agree as follows:</b></big><br /> 
1.LOAN AMOUNT: <br />
Lender agrees to loan Borrower the principal sum of &nbsp; <b><%=ds.getLoanamount()%></b> &nbsp; (the “Loan”), together with interest <b><%=ds.getInterest()%></b> on the outstanding principal loan amount <b><%=ds.getLoanamount() %></b> of the Loan (the "Principal Balance"), and in accordance with 
the terms set forth below. 
<br />
2.REPAYMENT OF LOAN: <br />
Single Payment: The Loan together with accrued and unpaid interest and all other charges, costs  and expenses, is due and payable on demand of the Lender on or before the stated repayment date &nbsp;<b><%=ds.getRepaydate()%></b>.
<br />
3.SECURITY: <br />
The loan is secured by collateral. Borrower agrees that until the Loan together with interest is 
paid in full, the Loan will be secured by &nbsp;<b><%=ds.getColname() %></b> &nbsp;with the model id <b><%=ds.getColid()%></b> ,and Borrower hereby grants to Lender a security interest in and to such property and power to sell if the borrower out rightly 
refuses to pay both the incurred interest or the principal balance on the due date <b><%=ds.getRepaydate()%></b>. The borrower must show prove of ownership and if such prove is later identified to be false, the lender will be completely exonerated from any criminal liability. 
<br />
4.INTEREST: <br />
The Principal Balance shall bear interest at the rate of between 0.68 to 1.5% , Accruing daily. 
Notwithstanding, the total interest charged shall not exceed the maximum amount allowed by 
law and Borrower shall not be obligated to pay any interest in excess of such amount. 
<br />
5.LATE FEE: <br />
There is a late Fee. If Borrower fails to make a payment due under this Agreement within a day after the 
due date, Borrower agrees to pay to Lender a late  payment fee of  2% of the amount then due, Accruing daily.
<br />
6.PREPAYMENT: <br />
Borrower has the right to prepay all or any part of the Loan, together with accrued and unpaid interest thereon, at any time without prepayment penalty or premium of any kind. 
Borrower must provide days prior written notice to Lender of the prepayment and the amount of the prepayment. 
<br />
7.ACCELERATION:<br />
In the event Borrower is more than 7 days late with a payment, Lender in its sole discretion may demand that the Principal Balance and any accrued and unpaid interest be immediately due and payable in full. 
<br />
8.<b>REMEDIES:</b><br />
Lender may enforce its rights or remedies in equity or at law, or both, whether for specific performance of any provision in this Agreement or to enforce the payment of the Loan or any  other legal or equitable right or remedy. 
The rights and remedies of Lender now or hereafter existing at law or in equity or by statute or otherwise shall be cumulative and shall be in addition to every other such right or remedy. 
<br />
9.COSTS AND EXPENSES:<br />
Borrower shall pay to Lender all costs of collection, including reasonable attorney's fees, Lender  incurs in enforcing this Agreement. 
<br />
10.LOAN EXTENSION:<br />
Borrower has the right to extend the loan due date when the accumulated interest for the previous due date has been paid. 
<br />
 
11.ENTIRE AGREEMENT <br />
This Agreement contains the entire understanding between the parties and supersedes and  cancels all prior agreements of the parties, whether oral or written, with respect to such subject matter. 
 <br/><br />
 <big><b>Borrower Sign</b></big>____________________________<big><b>Lender Sign</b></big>_____________________________________
  </p>

  

                    </div>
                </div>
            </div>
            </div>
            <button type="submit" class="btn btn-success btn-block"  id="d" onclick="myprint();">print</button> 
        </div>
        <div class="col-md-1"></div>
    </div>
</div> 
<script>
    function myprint(){
        var body = document.getElementById('body').innerHTML;
        var data = document.getElementById('data').innerHTML;
        document.getElementById('body').innerHTML = data;
        window.print();
        document.getElementById('body').innerHTML = body;
   }
</script>
 
</body>
</html>
  