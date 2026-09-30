<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%
String search=request.getParameter("search");
String filter=request.getParameter("filter");

if(search==null)
search="";

if(filter==null)
filter="";
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Explore Packages | Travel Management System</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

html{
scroll-behavior:smooth;
}

body{

background:
linear-gradient(
135deg,
#081120,
#0f172a,
#132238,
#081120);

background-size:400% 400%;

animation:bgMove 18s ease infinite;

min-height:100vh;

overflow-x:hidden;

color:white;

}

@keyframes bgMove{

0%{
background-position:0% 50%;
}

50%{
background-position:100% 50%;
}

100%{
background-position:0% 50%;
}

}

a{
text-decoration:none;
color:inherit;
}

.hero{

width:100%;

height:380px;

border-radius:30px;

position:relative;

overflow:hidden;

margin-bottom:45px;

box-shadow:
0 25px 50px rgba(0,0,0,.45);

background:
linear-gradient(
rgba(0,0,0,.45),
rgba(0,0,0,.55)
),

url(images/package1.jpg);

background-size:cover;

background-position:center;

display:flex;

justify-content:center;

align-items:center;

text-align:center;

}

.hero::before{

content:"";

position:absolute;

inset:0;

background:

linear-gradient(
135deg,
rgba(14,165,233,.25),
rgba(37,99,235,.18),
rgba(255,255,255,0));

}

.hero-content{

position:relative;

z-index:2;

padding:20px;

}

.hero h1{

font-size:56px;

font-weight:800;

letter-spacing:1px;

margin-bottom:15px;

text-shadow:
0 8px 25px rgba(0,0,0,.5);

}

.hero p{

font-size:18px;

opacity:.95;

max-width:900px;

margin:auto;

line-height:32px;

}

.search-panel{

width:95%;

max-width:1180px;

margin:auto;

margin-top:-60px;

margin-bottom:45px;

background:rgba(255,255,255,.08);

backdrop-filter:blur(20px);

border:1px solid rgba(255,255,255,.12);

border-radius:25px;

padding:30px;

box-shadow:
0 20px 45px rgba(0,0,0,.35);

position:relative;

z-index:5;

}

.search-panel form{

display:flex;

justify-content:center;

align-items:center;

gap:20px;

flex-wrap:wrap;

}

.search-panel input{

width:320px;

padding:16px 18px;

border:none;

outline:none;

border-radius:14px;

background:white;

font-size:15px;

transition:.35s;

}

.search-panel input:focus{

transform:scale(1.03);

box-shadow:
0 0 0 4px rgba(59,130,246,.35);

}

.search-panel select{

width:250px;

padding:16px;

border:none;

outline:none;

border-radius:14px;

background:white;

font-size:15px;

transition:.35s;

}

.search-panel select:focus{

transform:scale(1.03);

box-shadow:
0 0 0 4px rgba(59,130,246,.35);

}

.search-btn{

padding:16px 32px;

border:none;

border-radius:14px;

cursor:pointer;

font-size:15px;

font-weight:700;

color:white;

background:

linear-gradient(
135deg,
#0ea5e9,
#2563eb);

transition:.35s;

}

.search-btn:hover{

transform:translateY(-3px);

box-shadow:
0 12px 30px rgba(37,99,235,.45);

}
/* ===========================
   PACKAGE SECTION
=========================== */

.container{

    width:95%;
    max-width:1400px;
    margin:auto;

}

.section-title{

    text-align:center;
    margin-bottom:40px;

}

.section-title h2{

    font-size:42px;
    font-weight:700;
    color:#fff;
    margin-bottom:10px;

}

.section-title p{

    color:#cbd5e1;
    font-size:17px;

}

/* GRID */

.packages{

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(340px,1fr));

    gap:35px;

    margin-bottom:60px;

}

/* CARD */

.card{

    position:relative;

    overflow:hidden;

    border-radius:25px;

    background:
    rgba(255,255,255,.08);

    backdrop-filter:blur(15px);

    border:
    1px solid rgba(255,255,255,.10);

    transition:.40s;

    box-shadow:
    0 15px 35px rgba(0,0,0,.35);

}

.card:hover{

    transform:
    translateY(-12px);

    box-shadow:
    0 25px 45px rgba(0,0,0,.45);

}

/* IMAGE */

.card-image{

    position:relative;

    overflow:hidden;

}

.card-image img{

    width:100%;
    height:240px;

    object-fit:cover;

    transition:.5s;

}

.card:hover img{

    transform:scale(1.08);

}

/* OFFER */

.offer{

    position:absolute;

    top:18px;
    left:18px;

    background:#ef4444;

    color:white;

    padding:8px 16px;

    border-radius:30px;

    font-size:13px;

    font-weight:600;

    box-shadow:
    0 8px 20px rgba(0,0,0,.35);

}

/* RATING */

.rating{

    position:absolute;

    right:18px;
    top:18px;

    background:#fff;

    color:#f59e0b;

    padding:8px 14px;

    border-radius:30px;

    font-weight:700;

}

/* CONTENT */

.card-content{

    padding:25px;

}

.card-content h3{

    color:white;

    font-size:28px;

    margin-bottom:10px;

}

.location{

    color:#60a5fa;

    margin-bottom:15px;

    font-size:15px;

}

.description{

    color:#d1d5db;

    line-height:28px;

    margin-bottom:18px;

}

/* FEATURES */

.features{

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:10px;

    margin-bottom:20px;

}

.features div{

    background:
    rgba(255,255,255,.08);

    border-radius:10px;

    padding:10px;

    color:#fff;

    font-size:14px;

}

/* PRICE */

.price-row{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-top:20px;

}

.price{

    font-size:34px;

    color:#22c55e;

    font-weight:700;

}

.price small{

    font-size:14px;

    color:#cbd5e1;

}

/* BUTTON */

.book-btn{

    background:

    linear-gradient(
    135deg,
    #22c55e,
    #16a34a);

    color:white;

    padding:14px 25px;

    border-radius:12px;

    font-weight:700;

    transition:.35s;

    display:inline-block;

}

.book-btn:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(34,197,94,.40);

}

/* FOOTER */

.footer{

    text-align:center;

    padding:30px;

    color:#94a3b8;

    font-size:15px;

}

/* RESPONSIVE */

@media(max-width:900px){

.hero{

height:320px;

}

.hero h1{

font-size:38px;

}

.search-panel{

margin-top:-40px;

padding:20px;

}

.search-panel input,
.search-panel select,
.search-btn{

width:100%;

}

.section-title h2{

font-size:34px;

}

.packages{

grid-template-columns:1fr;

}

}

@media(max-width:600px){

.hero{

height:280px;

}

.hero h1{

font-size:30px;

}

.hero p{

font-size:15px;
line-height:28px;

}

.card-content h3{

font-size:22px;

}

.price{

font-size:28px;

}

.features{

grid-template-columns:1fr;

}

}

</style>

</head>

<body>

<%@ include file="backButton.jsp" %>
<!-- ================= HERO SECTION ================= -->

<div class="hero">

    <div class="hero-content">

        <h1>Explore India's Best Travel Packages</h1>

        <p>
            Discover luxury hotels, premium destinations, unforgettable experiences,
            and book your dream vacation at the best prices.
        </p>

    </div>

</div>

<!-- ================= SEARCH PANEL ================= -->

<div class="search-panel">

    <form method="get">

        <input
            type="text"
            name="search"
            placeholder="🔍 Search Package or City..."
            value="<%= search %>">

        <select name="filter">

            <option value="">Sort By Price</option>

            <option value="low"
                <%= "low".equals(filter) ? "selected" : "" %>>
                Price : Low to High
            </option>

            <option value="high"
                <%= "high".equals(filter) ? "selected" : "" %>>
                Price : High to Low
            </option>

        </select>

        <button class="search-btn">
            <i class="fa-solid fa-magnifying-glass"></i>
            Search
        </button>

    </form>

</div>

<!-- ================= TITLE ================= -->

<div class="container">

    <div class="section-title">

        <h2>Premium Travel Packages</h2>

        <p>
            Handpicked luxury hotels and amazing destinations across India.
        </p>

    </div>

    <div class="packages">

<%

class Pack{

    String name;
    String hotel;
    String city;
    String description;
    String price;
    String image;
    String days;

    Pack(
        String name,
        String hotel,
        String city,
        String description,
        String price,
        String image,
        String days){

        this.name=name;
        this.hotel=hotel;
        this.city=city;
        this.description=description;
        this.price=price;
        this.image=image;
        this.days=days;

    }

}


/* ================= PACKAGE DATA ================= */

Pack[] packs={


new Pack(

"Delhi Royal Package",

"Taj Palace Hotel Delhi",

"Delhi",

"Luxury stay at Taj Palace Delhi with city sightseeing, premium rooms, breakfast and airport pickup facility.",

"10500",

"package1.jpg",

"6 Days / 5 Nights"

),



new Pack(

"Mumbai Luxury Package",

"Taj Hotel Mumbai",

"Mumbai",

"Experience Mumbai luxury stay with Marine Drive visit, premium dining and beautiful city tour.",

"12600",

"package2.jpg",

"4 Days / 3 Nights"

),



new Pack(

"Udaipur Palace Package",

"The Oberoi Udaivilas Hotel Udaipur",

"Udaipur",

"Royal palace experience with lake view rooms, heritage sightseeing and luxury services.",

"5000",

"package3.jpg",

"6 Days / 5 Nights"

),



new Pack(

"Jaipur Heritage Package",

"Rambagh Palace Hotel Jaipur",

"Jaipur",

"Explore Rajasthan culture with palace stay, forts, local sightseeing and royal hospitality.",

"12090",

"package2.jpg",

"5 Days / 4 Nights"

),



new Pack(

"Agra Taj View Package",

"The Oberoi Amarvilas Hotel Agra",

"Agra",

"Enjoy Taj Mahal view luxury room, heritage places and unforgettable Agra experience.",

"9000",

"package3.jpg",

"8 Days / 7 Nights"

),



new Pack(

"Bengaluru Business Package",

"The Oberoi Hotel Bengaluru",

"Bengaluru",

"Premium business class stay with city tour and luxury hotel facilities.",

"17000",

"package1.jpg",

"9 Days / 8 Nights"

),



new Pack(

"Kolkata Heritage Package",

"The Oberoi Grand Hotel Kolkata",

"Kolkata",

"Discover Kolkata heritage locations with luxury stay and premium hospitality.",

"8500",

"package3.jpg",

"3 Days / 2 Nights"

),



new Pack(

"Chennai Luxury Package",

"ITC Grand Chola Hotel Chennai",

"Chennai",

"Luxury Chennai tour with beach visit, cultural places and premium hotel services.",

"11000",

"package1.jpg",

"12 Days / 11 Nights"

),



new Pack(

"Hyderabad Palace Package",

"Taj Falaknuma Palace Hotel Hyderabad",

"Hyderabad",

"Royal palace stay with Charminar visit, food tour and historical sightseeing.",

"11800",

"package2.jpg",

"3 Days / 2 Nights"

),



new Pack(

"Kochi Backwater Package",

"Brunton Boatyard Hotel Kochi",

"Kochi",

"Beautiful Kerala experience with backwater cruise, luxury stay and local sightseeing.",

"13000",

"package1.jpg",

"7 Days / 6 Nights"

)


};



/* ================= SORTING ================= */


if("low".equals(filter)){


Arrays.sort(
packs,
(a,b)->Integer.parseInt(a.price)
-
Integer.parseInt(b.price)

);


}



if("high".equals(filter)){


Arrays.sort(
packs,
(a,b)->Integer.parseInt(b.price)
-
Integer.parseInt(a.price)

);


}




/* ================= DISPLAY LOOP ================= */


for(Pack p:packs){


if(
!search.equals("")
&&
!p.name.toLowerCase()
.contains(search.toLowerCase())
&&
!p.city.toLowerCase()
.contains(search.toLowerCase())
&&
!p.hotel.toLowerCase()
.contains(search.toLowerCase())
)

{

continue;

}


%>
<!-- ================= PACKAGE CARD ================= -->


<div class="card">


    <!-- IMAGE SECTION -->

    <div class="card-image">


        <img 
        src="<%=request.getContextPath()%>/images/<%=p.image%>"
        alt="<%=p.name%>">


        <div class="offer">

            🔥 20% OFF

        </div>


        <div class="rating">

            ⭐ 4.8

        </div>


    </div>




    <!-- CONTENT SECTION -->


    <div class="card-content">


        <h3>

            <%=p.name%>

        </h3>



        <div class="location">

            <i class="fa-solid fa-hotel"></i>

            <%=p.hotel%>

            <br>

            <i class="fa-solid fa-location-dot"></i>

            <%=p.city%>

        </div>




        <div class="description">


            <%=p.description%>


        </div>




        <!-- FEATURES -->


      <% if(p.name.equals("Delhi Royal Package")){ %>

         <div class="features">
          <div>🏨 5-Star Luxury Hotel</div>
           <div>🚖 Airport Pickup</div>
            <div>🍽 Complimentary Breakfast</div>
             <div>📶 Free WiFi</div>
              <div>🕌 India Gate Tour</div>
               <div>🏛 Red Fort Visit</div>
                <div>🛍 Chandni Chowk Shopping</div>
                 </div>
            

      <% } else if(p.name.equals("Mumbai Luxury Package")){ %>

          <div class="features">
           <div>🏨 Sea View Hotel</div>
            <div>🚖 Airport Pickup</div>
             <div>🍽 Buffet Breakfast</div>
              <div>📶 Free WiFi</div>
               <div>🌊 Marine Drive</div>
                <div>🚢 Gateway of India</div>
                 <div>🛍 Colaba Shopping</div>
                  </div>

      <% } else if(p.name.equals("Udaipur Palace Package")){ %>

          <div class="features">
           <div>🏰 Palace Stay</div>
            <div>🚖 Pickup Service</div>
             <div>🍽 Royal Dinner</div>
              <div>📶 Free Wifi</div>
               <div>🚤 Lake Pichola Ride</div>
                <div>📸 City Palace Tour</div>
                 <div>🌅 Sunset Point</div>
                  </div>

      <% } else if(p.name.equals("Jaipur Heritage Package")){ %>

          <div class="features">
           <div>🏰 Heritage Palace</div>
            <div>🚖 Pickup Service</div>
             <div>🍽 Breakfast Include</div>
              <div>📶 Free WiFi</div>
               <div>🏯 Amer Fort</div>
                <div>🌬 Hawa mahal</div>
                 <div>🛍 Bapu Bazaar</div>
                  </div>

<% } else if(p.name.equals("Agra Taj View Package")){ %>

<div class="features">
<div>🏨 Taj View Room</div>
<div>🚖 Pickup Service</div>
<div>🍽 Breakfast Included</div>
<div>📶 Free WiFi</div>
<div>🕌 Taj Mahal</div>
<div>🏰 Agra Fort</div>
<div>🌇 Mehtab Bagh</div>
</div>

<% } else if(p.name.equals("Bengaluru Business Package")){ %>

<div class="features">
<div>🏨 Business Lounge</div>
<div>🚖 Airport Pickup</div>
<div>🍽 Breakfast Buffet</div>
<div>📶 High Speed WiFi</div>
<div>🌳 Lalbagh Garden</div>
<div>🏛 Bangalore Palace</div>
<div>🛍 UB City Mall</div>
</div>

<% } else if(p.name.equals("Kolkata Heritage Package")){ %>

<div class="features">
<div>🏨 Heritage Hotel</div>
<div>🚖 Pickup Service</div>
<div>🍽 Complimentary Breakfast</div>
<div>📶 Free WiFi</div>
<div>🏛 Victoria Memorial</div>
<div>🌉 Howrah Bridge</div>
<div>🛍 New Market</div>
</div>

<% } else if(p.name.equals("Chennai Luxury Package")){ %>

<div class="features">
<div>🏨 Premium Stay</div>
<div>🚖 Pickup Service</div>
<div>🍽 South Indian Breakfast</div>
<div>📶 Free WiFi</div>
<div>🏖 Marina Beach</div>
<div>🛕 Kapaleeshwar Temple</div>
<div>🛍 Phoenix Mall</div>
</div>

<% } else if(p.name.equals("Hyderabad Palace Package")){ %>

<div class="features">
<div>🏰 Palace Stay</div>
<div>🚖 Pickup Service</div>
<div>🍽 Hyderabadi Breakfast</div>
<div>📶 Free Wifi</div>
<div>🕌 Charminar</div>
<div>🏯 Golconda Fort</div>
<div>🍛 Famous Biryani</div>
</div>

<% } else if(p.name.equals("Kochi Backwater Package")){ %>

<div class="features">
<div>🏨 Waterfront Hotel</div>
<div>🚖 Pickup Service</div>
<div>🍽 Kerala Breakfast</div>
<div>📶 Free WiFi</div>
<div>🚤 Backwater Cruise</div>
<div>🌴 Fort Kochi</div>
<div>🐘 Cultural Show</div>
</div>

<% } %>




        <div class="location">

            <i class="fa-solid fa-calendar-days"></i>

            <%=p.days%>


        </div>





        <!-- PRICE + BUTTON -->


        <div class="price-row">


            <div class="price">


                ₹ <%=p.price%>

                <small>

                    /person

                </small>


            </div>




            <a 
            class="book-btn"
            href="bookPackage.jsp?package=<%=p.name%>&price=<%=p.price%>">


                BOOK NOW


            </a>



        </div>



    </div>



</div>



<%

}

%>


</div>

</div>
<%

// No package found message

if(packs.length==0){

%>

<div style="
text-align:center;
padding:50px;
font-size:25px;
color:white;
">

    😔 No Packages Available

</div>


<%

}

%>


<!-- ================= FOOTER ================= -->


<div class="footer">


    <h3>

        Travel Management System

    </h3>


    <p>

        Explore India's premium hotels and unforgettable travel experiences.

    </p>


    <p>

        © 2026 Travel Management System | All Rights Reserved

    </p>


</div>



<!-- ================= EXTRA EFFECTS ================= -->


<script>


// Card Animation On Scroll

const cards=document.querySelectorAll(".card");


const observer=new IntersectionObserver(

(entries)=>{


entries.forEach(entry=>{


if(entry.isIntersecting){


entry.target.style.opacity="1";

entry.target.style.transform="translateY(0)";


}


});


},

{

threshold:0.15

}



);



cards.forEach(card=>{


card.style.opacity="0";

card.style.transform="translateY(50px)";

card.style.transition="0.7s";


observer.observe(card);


});



</script>



</body>


</html>