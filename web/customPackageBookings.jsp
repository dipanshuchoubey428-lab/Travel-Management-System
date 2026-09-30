<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

    <title>Custom Package Bookings</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        /* HEADER */

        .header {
            background: linear-gradient(135deg, #0d47a1, #1976d2);
            color: white;
            padding: 25px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 28px;
        }

        .header p {
            margin-top: 5px;
            opacity: 0.9;
        }

        .back-btn {
            text-decoration: none;
            background: white;
            color: #0d47a1;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: bold;
        }

        .back-btn:hover {
            background: #e3f2fd;
        }

        /* CONTAINER */

        .container {
            width: 95%;
            margin: 30px auto;
        }

        .title-box {
            margin-bottom: 20px;
        }

        .title-box h2 {
            color: #0d47a1;
            margin-bottom: 5px;
        }

        .title-box p {
            color: #666;
        }

        /* TABLE BOX */

        .table-box {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.10);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }

        thead {
            background: #0d47a1;
            color: white;
        }

        th {
            padding: 14px 10px;
            text-align: center;
            font-size: 14px;
        }

        td {
            padding: 13px 10px;
            text-align: center;
            border-bottom: 1px solid #e5e5e5;
            font-size: 14px;
        }

        tbody tr:hover {
            background: #f5f9ff;
        }

        /* STATUS */

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: bold;
            display: inline-block;
        }

        .pending {
            background: #fff3cd;
            color: #856404;
        }

        .approved {
            background: #d4edda;
            color: #155724;
        }

        .rejected {
            background: #f8d7da;
            color: #721c24;
        }

        /* PRICE */

        .price {
            font-weight: bold;
            color: #0d47a1;
        }

        /* BUTTONS */

        .action-btn {
            text-decoration: none;
            padding: 7px 12px;
            border-radius: 6px;
            color: white;
            font-size: 13px;
            font-weight: bold;
            margin: 2px;
            display: inline-block;
        }

        .approve {
            background: #2e7d32;
        }

        .approve:hover {
            background: #1b5e20;
        }

        .reject {
            background: #c62828;
        }

        .reject:hover {
            background: #8e0000;
        }

        /* EMPTY */

        .empty {
            text-align: center;
            padding: 40px;
            color: #777;
            font-size: 18px;
        }

        /* ERROR */

        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* MOBILE */

        @media(max-width: 768px) {

            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .container {
                width: 98%;
            }

        }

    </style>

</head>


<body>


<%
    /*
     * Admin Session Check
     */

    String adminUsername = (String) session.getAttribute("adminUsername");

    /*
     * Agar aapke project me admin session ka naam
     * different hai to is check ko hata sakte hain.
     *
     * Abhi direct page ko continue karne diya gaya hai
     * taaki existing project me session-name ki wajah se
     * problem na aaye.
     */
%>


<!-- HEADER -->

<div class="header">

    <div>

        <h1>Custom Package Bookings</h1>

        <p>
            Manage all custom package bookings
        </p>

    </div>


    <a href="adminDashboard.jsp" class="back-btn">
        ? Admin Dashboard
    </a>

</div>


<!-- MAIN CONTAINER -->

<div class="container">


    <div class="title-box">

        <h2>Custom Package Booking List</h2>

        <p>
            View user selected destination, services, price and booking status.
        </p>

    </div>


<%

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    int totalBookings = 0;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");


        con = DriverManager.getConnection(

            "jdbc:mysql://localhost:3306/travelmanagementsystem",
            "root",
            "Mysql@1234"

        );


        /*
         * Get all custom package bookings
         */

        String sql =
            "SELECT id, username, place, hotel, cab, guide, food, ticket, price, status " +
            "FROM bookcustompackage " +
            "ORDER BY id DESC";


        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

%>


        <div class="table-box">


            <table>


                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Username</th>

                        <th>Place</th>

                        <th>Hotel</th>

                        <th>Cab</th>

                        <th>Guide</th>

                        <th>Food</th>

                        <th>Ticket</th>

                        <th>Total Price</th>

                        <th>Status</th>

                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>


<%

        while(rs.next()) {

            totalBookings++;

%>


                    <tr>


                        <!-- ID -->

                        <td>
                            <%= rs.getInt("id") %>
                        </td>


                        <!-- USERNAME -->

                        <td>
                            <%= rs.getString("username") %>
                        </td>


                        <!-- PLACE -->

                        <td>
                            <strong>
                                <%= rs.getString("place") %>
                            </strong>
                        </td>


                        <!-- HOTEL -->

                        <td>
                            ?<%= rs.getString("hotel") %>
                        </td>


                        <!-- CAB -->

                        <td>
                            ?<%= rs.getString("cab") %>
                        </td>


                        <!-- GUIDE -->

                        <td>
                            ?<%= rs.getString("guide") %>
                        </td>


                        <!-- FOOD -->

                        <td>
                            ?<%= rs.getString("food") %>
                        </td>


                        <!-- TICKET -->

                        <td>
                            ?<%= rs.getString("ticket") %>
                        </td>


                        <!-- TOTAL PRICE -->

                        <td class="price">

                            ?<%= rs.getString("price") %>

                        </td>


                        <!-- STATUS -->

                        <td>

<%

                            String status = rs.getString("status");

                            if(status == null) {
                                status = "Pending";
                            }

                            if(status.equalsIgnoreCase("Approved")) {

%>

                                <span class="status approved">
                                    Approved
                                </span>

<%

                            } else if(status.equalsIgnoreCase("Rejected")) {

%>

                                <span class="status rejected">
                                    Rejected
                                </span>

<%

                            } else {

%>

                                <span class="status pending">
                                    Pending
                                </span>

<%

                            }

%>

                        </td>


                        <!-- ACTION -->

                        <td>


<%

                            if(status.equalsIgnoreCase("Pending")) {

%>


                                <a
                                    href="ApproveCustomPackageServlet?id=<%= rs.getInt("id") %>"
                                    class="action-btn approve"
                                    onclick="return confirm('Approve this custom package booking?');"
                                >
                                    Approve
                                </a>


                                <a
                                    href="RejectCustomPackageServlet?id=<%= rs.getInt("id") %>"
                                    class="action-btn reject"
                                    onclick="return confirm('Reject this custom package booking?');"
                                >
                                    Reject
                                </a>


<%

                            } else if(status.equalsIgnoreCase("Approved")) {

%>

                                <span style="color:#2e7d32;font-weight:bold;">
                                    ? Approved
                                </span>

<%

                            } else {

%>

                                <span style="color:#c62828;font-weight:bold;">
                                    ? Rejected
                                </span>

<%

                            }

%>


                        </td>


                    </tr>


<%

        }


        if(totalBookings == 0) {

%>


                    <tr>

                        <td colspan="11" class="empty">

                            No Custom Package Bookings Found.

                        </td>

                    </tr>


<%

        }

%>


                </tbody>


            </table>


        </div>


<%

    } catch(Exception e) {

%>


        <div class="error">

            Database Error:

            <%= e.getMessage() %>

        </div>


<%

        e.printStackTrace();

    } finally {


        try {

            if(rs != null)
                rs.close();

        } catch(Exception e) {}


        try {

            if(ps != null)
                ps.close();

        } catch(Exception e) {}


        try {

            if(con != null)
                con.close();

        } catch(Exception e) {}

    }

%>


</div>


</body>

</html>