﻿<%@ Page Language="C#" AutoEventWireup="false" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="Scripts/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="Scripts/js/jquery-3.3.1.min.js"></script>
    <script src="Scripts/js/popper.min.js"></script>
    <script src="Scripts/js/bootstrap.min.js"></script>

</head>
<body style="padding: 10px; overflow-x: hidden">
    <style>
        .invalid-input {
            color: red;
            font-size: small;
            padding-left: 2px
        }
    </style>
    <div class="container col-8 align-content-center">
        <form id="form1" runat="server">
            <h1>Register at HRMS</h1>
            <hr style="height: 4px" />
            <div>
                <asp:Label ID="AlertLabel" runat="Server" CssClass="row alert alert-primary" Visible="false" role="alert"></asp:Label>
            </div>
            <div class="row" style="justify-content: space-between">
                
                <div class="form-group row col-5" style="align-items: center; justify-content: space-evenly;">
                    <label for="profileImage" class="">Click on the picture to select avatar</label>
                    <div style="width: 3px; height: 95%; border-right: solid rgba(0,0,0,.1)"></div>
                    <div id="profile-container">
                        <img id="profileImage" class="imgWidthGreater" src="Uploads/ProfilePictures/profilePic.png" />
                    </div>
                    <asp:FileUpload ID="imageUpload" accept="image/jpeg, image/png" AllowMultiple="false" name="profile_photo" runat="server" />
                    <br />
                    <asp:Label ID="imageLabel" Visible="false" CssClass="invalid-input" runat="server"></asp:Label>
                </div>
                <div class="form-group col-5">
                    <div class="form-group form-row">

                        <label class="col-form-label" for="RoleInput">What role do you want to register for?</label>
                        <asp:DropDownList ID="RoleInput" CssClass="form-control" runat="server" ValidationGroup="vg">
                            <asp:ListItem Enabled="False" Value="-1">Select Role</asp:ListItem>
                            <asp:ListItem Value="hr">Human Resource Manager</asp:ListItem>
                            <asp:ListItem Value="simpleuser">User/Employee</asp:ListItem>
                            <asp:ListItem Value="moderator">Moderator</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
            <div class="row" style="justify-content: space-between">
                <div class="col-5">
                    <div class="form-group form-row">
                        <label class="col-form-label" for="FirstNameInput">First Name</label>
                        <asp:TextBox runat="server" type="text" CssClass="form-control" ID="FirstNameInput" ValidationGroup="vg" required />
                        <asp:RegularExpressionValidator runat="server" CssClass="invalid-input" ErrorMessage="*Invalid Input" ControlToValidate="FirstNameInput" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="vg" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group form-row">
                        <label class="col-form-label" for="LastNameInput">Last Name</label>
                        <asp:TextBox runat="server" type="textt" CssClass="form-control" ID="LastNameInput" ValidationGroup="vg" required />
                        <asp:RegularExpressionValidator runat="server" CssClass="invalid-feedback" ErrorMessage="*Invalid Input" ControlToValidate="LastNameInput" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="vg" Display="Dynamic"></asp:RegularExpressionValidator>

                    </div>
                    <div class="form-group form-row">
                        <label class="col-form-label" for="EmailInput">Email</label>
                        <asp:TextBox runat="server" type="email" CssClass="form-control" ID="EmailInput" required ValidationGroup="vg" />
                        <asp:Label ID="EmailLabel" runat="server" CssClass="invalid-input"></asp:Label>
                        <asp:RegularExpressionValidator runat="server" ErrorMessage="*Enter a valid email" CssClass="invalid-input" ValidationGroup="vg" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ControlToValidate="EmailInput" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                </div>
                <div class="col-5">

                    <div class="form-group form-row">
                        <label class="col-form-label" for="PasswordInput">Password</label>
                        <asp:TextBox runat="server" type="password" required CssClass="form-control" ID="PasswordInput" ValidationGroup="vg" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="PasswordInput" ValidationGroup="vg" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" Display="Dynamic" ErrorMessage="*Invalid, must include one uppercase, one lowercase, one number and minimum lenght of 8 character" CssClass="invalid-input"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group form-row">
                        <label class="col-form-label" for="ConfirmPasswordInput">Confirm Password</label>
                        <asp:TextBox runat="server" type="password" required CssClass="form-control" ID="ConfirmPasswordInput" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="ConfirmPasswordInput" ValidationGroup="vg" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" Display="Dynamic" ErrorMessage="*Invalid, must include one uppercase, one lowercase, one number and minimum lenght of 8 character" CssClass="invalid-input" Width="100%"></asp:RegularExpressionValidator>

                        <asp:CompareValidator runat="server" ControlToCompare="PasswordInput" ControlToValidate="ConfirmPasswordInput" ValidationGroup="vg" Display="Dynamic" ErrorMessage="*Passwords do not compare" CssClass="invalid-input"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <label for="FlatpickrCalender" style="padding-bottom: 5px; width: 100vw">Birthday</label>
                        <asp:TextBox runat="server" ValidationGroup="vg" ID="FlatpickrCalender" required Text="Select Date" class="form-control" type="text" placeholder="Select Date.." />
                        <asp:Label ID="BirthdayLabel" runat="server" CssClass="invalid-input"></asp:Label>
                        <asp:CompareValidator runat="server" ControlToValidate="FlatpickrCalender" CssClass="invalid-input" ErrorMessage="*Select a date" Font-Strikeout="False" Display="Dynamic" ValidationGroup="vg" ValueToCompare="Select Date" Operator="NotEqual"></asp:CompareValidator>
                    </div>
                    <asp:Button runat="server" CssClass="btn btn-success" ID="RegisterButton" Text="Register" OnClick="RegisterButton_Click" ValidationGroup="vg" />

                </div>

            </div>

        </form>
    </div>
    <style>
        #imageUpload {
            display: none;
        }

        #profileImage {
            cursor: pointer;
        }

        #profile-container {
            width: 100px;
            height: 100px;
            overflow: hidden;
            border-radius: 50%;
        }

        .imgWidthGreater{
            height:100%;
            width:auto;
        }
        .imgHeightGreater{
            width:100%;
            height:auto;
        }
    </style>
    <script>
        flatpickr("#FlatpickrCalender", {
            altInput: true,
            altFormat: "F j, Y",
            dateFormat: "Y-m-d",
        });
        $("#profileImage").click(function (e) {
            $("#imageUpload").click();
        });

        function fasterPreview(uploader) {
            if (uploader.files && uploader.files[0]) {
                $('#profileImage').attr('src',
                    window.URL.createObjectURL(uploader.files[0])).on('load', function () {
                        console.log(`${this.width} ${this.height} ${this}`);
                        if (this.width > this.height) {
                            $(this).removeClass('imgHeightGreater').addClass('imgWidthGreater');
                        } else {
                            $(this).removeClass('imgWidthGreater').addClass('imgHeightGreater');
                        }
                    });
                    
            }
        }

        $("#imageUpload").change(function () {
            fasterPreview(this);
        });
    </script>
</body>
</html>
