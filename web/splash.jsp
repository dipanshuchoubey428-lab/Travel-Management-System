<!DOCTYPE html>
<html>
<head>

    <title>Travel Management System</title>

    
    <meta http-equiv="refresh" content="6;url=login.html">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{

            width:100%;
            height:100vh;

            overflow:hidden;

            display:flex;
            justify-content:center;
            align-items:center;

            background:black;

            font-family:Arial,sans-serif;
        }

        /* SPLASH CONTAINER */

        .splash{

            width:300px;
            height:200px;

            background-image:url("images/splash.jpg");

            background-size:cover;
            background-position:center;

            border-radius:20px;

            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;

            color:white;

            box-shadow:0 0 30px cyan;

            animation:expand 4s ease-in-out forwards;
        }

        /* ZOOM ANIMATION */

        @keyframes expand{

            0%{

                width:0;
                height:0;

                opacity:0;
            }

            50%{

                width:600px;
                height:350px;

                opacity:1;
            }

            100%{

                width:100%;
                height:100vh;

                border-radius:0;
            }
        }

        h1{

            font-size:50px;

            text-shadow:2px 2px 10px black;
        }

        .loader{

            margin-top:20px;

            width:60px;
            height:60px;

            border:6px solid white;
            border-top:6px solid cyan;

            border-radius:50%;

            animation:spin 1s linear infinite;
        }

        @keyframes spin{

            100%{
                transform:rotate(360deg);
            }
        }

    </style>

</head>

<body>

    <div class="splash">

        <h1>Travel And tourism Management System</h1>

        <div class="loader"></div>

    </div>

</body>
</html>