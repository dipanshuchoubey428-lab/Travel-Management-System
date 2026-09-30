<%@ page contentType="text/html; charset=UTF-8" %>

<%
String place = request.getParameter("place");

String hotelParam = request.getParameter("hotel");
String cabParam = request.getParameter("cab");
String guideParam = request.getParameter("guide");
String foodParam = request.getParameter("food");
String ticketParam = request.getParameter("ticket");

if(place == null ||
   hotelParam == null ||
   cabParam == null ||
   guideParam == null ||
   foodParam == null ||
   ticketParam == null){

    response.sendRedirect("customPackage.jsp");
    return;
}

int hotel = Integer.parseInt(hotelParam);
int cab = Integer.parseInt(cabParam);
int guide = Integer.parseInt(guideParam);
int food = Integer.parseInt(foodParam);
int ticket = Integer.parseInt(ticketParam);

int total = hotel + cab + guide + food + ticket;

// Save custom package details in session
session.setAttribute("customPackagePrice", String.valueOf(total));
session.setAttribute("customPlace", place);
%>

<!DOCTYPE html>
<html>

<head>

    <title>Custom Package Result</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:#f4f7fb;
            color:#222;
        }

        .header{
            background:linear-gradient(135deg,#0d47a1,#1976d2);
            color:white;
            padding:40px 70px;
        }

        .header h1{
            font-size:36px;
            margin-bottom:8px;
        }

        .header p{
            font-size:16px;
        }

        .container{
            width:90%;
            max-width:850px;
            margin:40px auto;
        }

        .result-card{
            background:white;
            border-radius:18px;
            padding:35px;
            box-shadow:0 10px 30px rgba(0,0,0,0.10);
        }

        .result-card h2{
            color:#0d47a1;
            margin-bottom:10px;
        }

        .place-name{
            color:#666;
            margin-bottom:25px;
        }

        .price-row{
            display:flex;
            justify-content:space-between;
            padding:16px 0;
            border-bottom:1px solid #e1e7f0;
            font-size:16px;
        }

        .price-row span:first-child{
            font-weight:600;
            color:#333;
        }

        .price-row span:last-child{
            font-weight:bold;
            color:#0d47a1;
        }

        .total-box{
            margin-top:25px;
            background:linear-gradient(135deg,#0d47a1,#1976d2);
            color:white;
            padding:22px;
            border-radius:14px;
            display:flex;
            justify-content:space-between;
            font-size:24px;
            font-weight:bold;
        }

        .btn-area{
            margin-top:28px;
            display:flex;
            gap:15px;
            flex-wrap:wrap;
        }

        .btn{
            text-decoration:none;
            padding:13px 22px;
            border-radius:10px;
            font-weight:bold;
            transition:0.3s;
            border:none;
            cursor:pointer;
            font-size:15px;
        }

        .pay-btn{
            background:linear-gradient(135deg,#2e7d32,#1b5e20);
            color:white;
        }

        .back-btn{
            background:#eef3fb;
            color:#0d47a1;
        }

        .btn:hover{
            transform:translateY(-2px);
            box-shadow:0 8px 20px rgba(0,0,0,0.18);
        }

        @media(max-width:600px){

            .header{
                padding:30px 25px;
            }

            .header h1{
                font-size:28px;
            }

            .container{
                width:95%;
            }

            .result-card{
                padding:25px;
            }

            .total-box{
                font-size:20px;
            }

        }

    </style>

</head>


<body>

    <%@ include file="backButton.jsp" %>


    <!-- HEADER -->

    <div class="header">

        <h1>Your Custom Package</h1>

        <p>
            Review your selected travel services and total package cost.
        </p>

    </div>


    <!-- MAIN CONTAINER -->

    <div class="container">

        <div class="result-card">


            <h2>Package Summary</h2>


            <p class="place-name">

                Selected Place:

                <b>
                    <%= place %>
                </b>

            </p>


            <!-- HOTEL -->

            <div class="price-row">

                <span>
                    Hotel
                </span>

                <span>
                    ₹<%= hotel %>
                </span>

            </div>


            <!-- CAB -->

            <div class="price-row">

                <span>
                    Cab
                </span>

                <span>
                    ₹<%= cab %>
                </span>

            </div>


            <!-- GUIDE -->

            <div class="price-row">

                <span>
                    Guide
                </span>

                <span>
                    ₹<%= guide %>
                </span>

            </div>


            <!-- FOOD -->

            <div class="price-row">

                <span>
                    Food
                </span>

                <span>
                    ₹<%= food %>
                </span>

            </div>


            <!-- TICKET -->

            <div class="price-row">

                <span>
                    Ticket
                </span>

                <span>
                    ₹<%= ticket %>
                </span>

            </div>


            <!-- TOTAL -->

            <div class="total-box">

                <span>
                    Total Price
                </span>

                <span>
                    ₹<%= total %>
                </span>

            </div>


            <!-- BUTTON AREA -->

            <div class="btn-area">


                <!-- BOOK CUSTOM PACKAGE -->

                <form action="CustomPackageBookingServlet"
                      method="post"
                      style="margin:0;">

                    <input type="hidden"
                           name="place"
                           value="<%= place %>">


                    <input type="hidden"
                           name="hotel"
                           value="<%= hotel %>">


                    <input type="hidden"
                           name="cab"
                           value="<%= cab %>">


                    <input type="hidden"
                           name="guide"
                           value="<%= guide %>">


                    <input type="hidden"
                           name="food"
                           value="<%= food %>">


                    <input type="hidden"
                           name="ticket"
                           value="<%= ticket %>">


                    <input type="hidden"
                           name="price"
                           value="<%= total %>">


                    <button type="submit"
                            class="btn pay-btn">

                        Book Custom Package

                    </button>

                </form>


                <!-- MODIFY PACKAGE -->

                <a class="btn back-btn"
                   href="customPackage.jsp?place=<%= place %>">

                    Modify Package

                </a>


            </div>


        </div>

    </div>


</body>

</html>