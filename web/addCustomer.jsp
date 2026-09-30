
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:#0f172a;
    overflow-x:hidden;
}

/* MAIN CONTAINER */
.main-container{
    display:flex;
    width:100%;
    align-items:stretch;
}

/* LEFT SECTION */
.left-section{
    width:45%;

    background:
    linear-gradient(
        135deg,
        #0f172a 0%,
        #111827 50%,
        #1e293b 100%
    );

    display:flex;
    justify-content:center;
    align-items:center;

    position:relative;

    padding:40px 0;
}

/* GLOW EFFECTS */
.left-section::before{
    content:"";

    position:absolute;

    width:350px;
    height:350px;

    background:#2563eb;

    border-radius:50%;

    top:-120px;
    left:-120px;

    opacity:0.18;

    filter:blur(80px);
}

.left-section::after{
    content:"";

    position:absolute;

    width:250px;
    height:250px;

    background:#0ea5e9;

    border-radius:50%;

    bottom:-80px;
    right:-80px;

    opacity:0.18;

    filter:blur(80px);
}

/* FORM CONTAINER */
.container{
    width:100%;
    max-width:470px;

    padding:38px;

    position:relative;
    z-index:2;

    background:rgba(255,255,255,0.08);

    backdrop-filter:blur(14px);
    -webkit-backdrop-filter:blur(14px);

    border:1px solid rgba(255,255,255,0.12);

    border-radius:24px;

    box-shadow:
    0 10px 40px rgba(0,0,0,0.45);
}

/* HEADING */
h2{
    text-align:center;

    color:white;

    font-size:34px;
    font-weight:700;

    margin-bottom:30px;

    letter-spacing:1px;
}

/* SUCCESS */
.success{
    color:#00ffcc;

    text-align:center;

    margin-bottom:20px;

    font-weight:600;
}

/* LABELS */
label{
    display:block;

    color:#dbeafe;

    margin-bottom:8px;

    font-size:14px;
    font-weight:500;
}

/* INPUTS */
input,
select{
    width:100%;

    padding:14px 16px;

    margin-bottom:18px;

    border:none;
    outline:none;

    border-radius:14px;

    background:rgba(255,255,255,0.92);

    color:black;

    font-size:14px;

    transition:0.3s;

    box-shadow:
    inset 0 2px 6px rgba(0,0,0,0.15);
}

/* FOCUS EFFECT */
input:focus,
select:focus{
    transform:scale(1.01);

    box-shadow:
    0 0 0 3px rgba(59,130,246,0.3);
}

/* GENDER */
.gender{
    margin-bottom:18px;
    color:white;
}

.gender input{
    width:auto;
    margin-right:6px;
}

/* BUTTON */
button{
    width:100%;

    padding:15px;

    border:none;

    border-radius:14px;

    background:
    linear-gradient(
        135deg,
        #0ea5e9,
        #2563eb
    );

    color:white;

    font-size:16px;
    font-weight:600;

    cursor:pointer;

    transition:0.35s;
}

/* BUTTON HOVER */
button:hover{

    transform:translateY(-3px);

    box-shadow:
    0 12px 25px rgba(37,99,235,0.4);

    background:
    linear-gradient(
        135deg,
        #2563eb,
        #0ea5e9
    );
}

/* RIGHT IMAGE SECTION */
.right-section{
    width:55%;

    background:
    linear-gradient(
        rgba(15,23,42,0.20),
        rgba(15,23,42,0.20)
    ),
    url('<%=request.getContextPath()%>/images/newcustomer.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    position:relative;
}

/* IMAGE OVERLAY */
.right-section::after{
    content:"";

    position:absolute;

    top:0;
    left:0;

    width:100%;
    height:100%;

    background:
    linear-gradient(
        to left,
        rgba(0,0,0,0.10),
        rgba(0,0,0,0.35)
    );
}

/* RESPONSIVE */
@media(max-width:950px){

    .main-container{
        flex-direction:column;
    }

    .left-section,
    .right-section{
        width:100%;
    }

    .right-section{
        height:350px;
    }

}

</style>

<script>

function setPlaceholder(){

    let type =
    document.getElementById("idType").value;

    let numberField =
    document.getElementById("number");

    if(type === "Aadhar"){

        numberField.placeholder =
        "Enter 12-digit Aadhar Number";
    }

    else if(type === "PAN"){

        numberField.placeholder =
        "ABCDE1234F";
    }

    else if(type === "Voter"){

        numberField.placeholder =
        "Enter Voter ID Number";
    }

    else{

        numberField.placeholder =
        "Enter Number";
    }
}

</script>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<div class="main-container">

    <!-- LEFT FORM SECTION -->
    <div class="left-section">

        <div class="container">

            <h2>Add Customer</h2>

            <%
            String msg =
            request.getParameter("msg");

            if("success".equals(msg)){
            %>

            <p class="success">
                Customer Added Successfully!
            </p>

            <%
            }
            %>

            <form action="AddCustomerServlet"
                  method="post">

                <label>Username</label>

                <input type="text"
                       name="username">

                <label>ID Type</label>

                <select name="idType"
                        id="idType"
                        onchange="setPlaceholder()">

                    <option value="">
                        Select ID
                    </option>

                    <option value="Aadhar">
                        Aadhar Card
                    </option>

                    <option value="PAN">
                        PAN Card
                    </option>

                    <option value="Voter">
                        Voter ID
                    </option>

                </select>

                <label>Number</label>

                <input type="text"
                       name="number"
                       id="number"
                       placeholder="Enter Number">

                <label>Name</label>

                <input type="text"
                       name="name">

                <label>Gender</label>

                <div class="gender">

                    <input type="radio"
                           name="gender"
                           value="Male"> Male

                    &nbsp;&nbsp;&nbsp;

                    <input type="radio"
                           name="gender"
                           value="Female"> Female

                </div>

                <label>Country</label>

                <input type="text"
                       name="country">

                <label>Address</label>

                <input type="text"
                       name="address">

                <label>Phone</label>

                <input type="text"
                       name="phone">

                <label>Email</label>

                <input type="text"
                       name="email">

                <button type="submit">
                    Add Customer
                </button>

            </form>

        </div>

    </div>

    <!-- RIGHT IMAGE SECTION -->
    <div class="right-section"></div>

</div>

</body>
</html>