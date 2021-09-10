<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.higradius.Datagetset"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<% ArrayList dataRec = (ArrayList)request.getAttribute("dataRec");%>
    <!DOCTYPE html>
<html>
    <head>
        <title>Invoice Management Application</title>
    <link rel="stylesheet" href="landing.css">
    <script src="landing.js"></script>
    </head>
    <body>
    
        <header>
            <img src="images\abc_logo.svg" alt="HIGHRADIUS" class="customer"  width="235px" height="55px">
            <img src="images\logo.svg" alt="HIGHRADIUS" class="hrlogo" width="230px" height="45px">
        </header>

        <table class=invoice  width="141px" height="31px"> 
            <th> Invoice List</th>
        </table>

        <div> 
            <header> 
              <button class="Add" onclick="myfunction5()"><img src="images\Path 18189.svg" width="11px" > &nbsp;  Add </button>
              <button class="Edit" onclick="myfunction1()"><img src= "images\Path 18191.svg" width="12px" >&nbsp; Edit </button>
              <button class="Delete" onclick="myfunction3()">&mdash; &nbsp; Delete</button>
              <button class="Search" onclick="myfunction()"> Search by invoice number  &nbsp; &nbsp; <img src= "images\search-24px (3).svg" ></button>
            </header>

            <table class="dummy" style="float: left; position: relative; left: 30px">
                <thead>
                <th  height="5px"><input type="checkbox"></th>
                <th width="171px" height="20px">Customer Name </th>
                <th width="130px" height="20px">Customer #</th>
                <th width="200px" height="20px">Invoice #</th>
                <th width="157px" height="20px"> Invoice Amount</th>
                <th width="200px" height="20px">Due Date</th>
                <th width="228px" height="20px">Predicted Payment Date</th>
                <th width="310px" height="20px">Notes</th>
                </thead>
                <tbody>
                <% for (int recCount=0;recCount<dataRec.size();recCount++){%>
                <tr>
                <% Datagetset res=(Datagetset)dataRec.get(recCount); %>
                  <td><input type="checkbox"></td>
                  <td>
                  <%= res.getCoustomer()%>
                  </td>
                   <td>
                  <%= res.getCoust_no()%>
                  </td>
                  <td>
                  <%= res.getInvoice_no()%>
                  </td>
                    <td>
                  <%= res.getInvoice_ammount()%>
                  </td>
                    <td>
                  <%= res.getDue_date()%>
                  </td>
                    <td>
                  <%= res.getPredicted_date()%>
                  </td>
               
                  <td>
                  <%= res.getBucket()%>
                  </td>
                </tr>
                <%} %>
             
        
        
                </tbody>
                </table>
        </div>
       

        <dialog id="search-modal" class="editbox">
            <header>
                <span class="Name-font">Enter Invoice Number </span>
                <input type="number" placeholder="Search" class="Name-text-input">
            </header>
            <header  style="position: absolute; bottom: 5px;">
                <button class="reset-btn" onclick="myfunction7()">Cancel</button>
                <button class="save-btn">Ok</button>
            </header>
        </dialog>

        <dialog id="edit-modal" class="editbox">
            <header>
                <span class='Invoice_Font'>Edit Invoice</span> 
                <img class='baseline_close' src="images\baseline-close-24px.svg">
            </header>
            <header class="Invoice-Header">
                <span class="Invoice_Amount_Font">Invoice Amount</span>
                <span class="Invoice_Amount_Input"><input type="number" placeholder="Enter Invoice Amount" class="Name-text-input"></span>
            </header>
            <header class="Notes-Header">
                <span class="Notes_Font">Notes</span>
                <span class="Notes_Input"><input type="text" placeholder="Enter notes here" class="Name-text-input" style="padding: 20px;"></span>
            </header>
            <header>
                <button onclick="myfunction2()" id="cancel-btn">Cancel</button>
                <button class="reset-btn">Reset</button>
                <button class="save-btn">Save</button>
            </header>
        </dialog>

        <dialog id="delete-modal" class="deletebox">
            <header class="delete-header-1">
                <span class="delete-record-font" style="margin-right: 140px;"> Delete record(s)? </span>
                <img class='baseline_close' src="images\baseline-close-24px.svg">
            </header>
            <header>
                <span id='Delete-Modal-Font'>
                    You'll lose your record(s) after this action. We can't recover them once you delete. 
                    <header style="margin-top: 5px;">
                        Are you sure you want to <span style="color: red;">permanently delete</span> them?
                    </header>
                </span>
            </header>
            <header style="position: absolute; bottom: 20px;">
                <button class="cancel-btn-modal" onclick="myfunction4()">Cancel</button>
                <button class="save-btn">Delete</button>
            </header>
        </dialog>

        <dialog id="add-modal" class="addbox">
            <header>
                <span class="delete-record-font" style="margin-right: 600px;"> Add Invoice </span>
                <img class='baseline_close' src="images\baseline-close-24px.svg">
            </header>
            <header style="margin-top: 10px;">
                <span class="Name-font">
                    Customer Name<span style="color: red;">*</span> 
                    <input type="text" class="Name-text-input" style="margin-right: 120px;">
                </span>
                <span class="Name-font">
                    Due Date<span style="color: red;">*</span> 
                    <input type="date" class="Name-text-input">
                </span>
            </header>
            <header style="margin-top: 30px; margin-bottom: 10px;">
                <span class="Name-font">
                    Customer No.<span style="color: red;">*</span> 
                    <input type="number" class="Name-text-input" style="margin-right: 140px;">
                </span>
                <span class="Name-font">
                    Notes<span style="color: red;">*</span> 
                    <input type="text" class="Name-text-input" style="padding: 20px;">
                </span>
            </header>
            <header>
                <span class="Name-font" style="margin-top: 30px;">
                    Invoice No.<span style="color: red;">*</span> 
                    <input type="number" class="Name-text-input">
                </span>
            </header>
            <header style="margin-top: 30px;">
                <span class="Name-font">
                    Invoice Amount<span style="color: red;">*</span> 
                    <input type="number" class="Name-text-input">
                </span>
            </header>
            <header style="position: absolute; bottom: 2px;">
                <button onclick="myfunction6()" id="cancel-btn" style="margin-right: 500px;">Cancel</button>
                <button class="reset-btn">Clear</button>
                <button class="save-btn">Add</button>
            </header>
        </dialog>
    </body>
</html>