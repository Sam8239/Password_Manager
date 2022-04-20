<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PASSWORD MANAGER</title>
        <style>
            a:hover {
                color: red !important;
                border: 2px solid red !important;
                transform: translate(0, -5%);
            }
            body {
                background: linear-gradient(
                    to right,
                    #000 0%,
                    #000 50%,
                    aqua 50%,
                    aqua 100%
                    );
            }
        </style>
    </head>
    <body>
        <h1
            style="
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 3%;
            text-align: center;
            font-size: 50px;
            "
            >
            <span id="head" style="color: red;margin-right: 40px;">PASSWORD </span>
            MANAGER
        </h1>
        <div
            style="
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 25vh;
            width: 100%;
            font-size: 20px;
            "
            >
            <a
                href="./savepassword.jsp"
                style="
                text-decoration: none;
                background: #000;
                border-radius: 50%;
                padding: 30px;
                height: 30px;
                color: white;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 2px solid white;
                margin-left: 20%;
                margin-right: 7%;
                "
                >Save Passwords</a
            >
            <a
                href="./login.jsp"
                style="
                margin-right: 15%;
                text-decoration: none;
                background: #000;
                border-radius: 50%;
                padding: 30px;
                height: 30px;
                color: white;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 2px solid white;
                "
                >View Saved Passwords</a
            >
        </div>

    </body>
</html>

