<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>PASSWORD MANAGER</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <style>
            body{
                color: aqua;
            }
            .btn{
                font-weight: bold;
                padding: 15px;
                width: 7%;
                border-radius:50%;
                border:2px solid white;
                color: white;
                background-color: black;
            }
            .btn:hover{
                color: red!important;
                border:2px solid red;
                background-color: black;
            } 
            h1{
                font-weight: bold;
                font-size: 50px;
                margin-bottom: 5%;
            }
            a{
                text-decoration:none;
                color: black;
                font-weight: bold;
                font-size:20px;
                float: right;
                margin-right: 5%;
                border:2px solid white;
                border-radius:50%;
                padding: 10px;
                color: white;
                background-color: black;
            }
            a:hover{
                color: red;
                border:2px solid red;
            }
        </style>
    </head>

    <body style="background-color: #000">
        <a href="index.jsp">BACK</a>
        <form action="savedata" method="POST">
            <div class="container text-center">
                <h1 class="text-center font-weight-bold pb-3 mt-4"><span style="color:red;">SAVE</span> PASSWORDS</h1>
                <div class="form-button d-flex justify-content-center">
                    <input
                        class="form-control"
                        id="user"
                        name="email"
                        placeholder="Email"
                        type="email"
                        required
                        autocomplete="off"
                        style="width: 30vw"
                        />
                </div>
                <br />
                <div class="form-button d-flex justify-content-center">
                    <input
                        class="form-control"
                        id="userpass"
                        name="userpass"
                        placeholder="Password For Password Manager"
                        type="password"
                        required
                        autocomplete="off"
                        style="width: 30vw"
                        />
                </div>
                <br />
                <div class="form-button d-flex justify-content-center">
                    <input
                        class="form-control mb-2"
                        id="uname"
                        name="uname"
                        placeholder="Username / Email"
                        type="text"
                        required
                        autocomplete="off"
                        style="width: 30vw"
                        />
                </div>
                <br />
                <div class="form-button d-flex justify-content-center">
                    <input
                        class="form-control"
                        id="pass"
                        name="pass"
                        placeholder="Password"
                        type="password"
                        required
                        autocomplete="off"
                        style="width: 30vw"
                        />
                </div>
                <br />
                <div class="form-button d-flex justify-content-center">
                    <button class="btn btn-light" name="submit" type="submit">SAVE</button>
                </div>
            </div>
        </form>
    </body>
</html>
