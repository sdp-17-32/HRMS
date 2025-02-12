﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HRHome.master" AutoEventWireup="true" CodeFile="HRAddEmployee.aspx.cs" Inherits="HRAddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="w-100">
        <div class="jumbotron col-10 mx-auto" style="padding-left: 5rem; padding-right: 5rem;">
            <h1 class="display-4">Add An Employee</h1>
            <hr class="my-4" />
            <div class="form-group">
                <asp:Label runat="server" CssClass="pr-2">Enter email to be associated with</asp:Label>
                <asp:TextBox TextMode="Email" CssClass="form-control" runat="server" ID="EmailTextBox" ValidationGroup="vg" required></asp:TextBox>
                <asp:Label runat="server" ID="EmailLabel"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label runat="server" CssClass="pr-2">Position Type</asp:Label>
                <asp:DropDownList CssClass="form-control" runat="server" ValidationGroup="vg" ID="PositionTypeDropdown">
                    <asp:ListItem Text="Select PositionType.." Value="-1"></asp:ListItem>
                    <asp:ListItem Text="President" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Vice-President" Value="1"></asp:ListItem>
                    <asp:ListItem Text="General Manager" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Senior Manager" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Team Manager" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Assistant Manager" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Staff" Value="3"></asp:ListItem>
                </asp:DropDownList>
                <asp:CompareValidator runat="server" CssClass="invalid-input" ErrorMessage="*Select An Option" ControlToValidate="PositionTypeDropdown" Display="Dynamic" ValidationGroup="vg" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" CssClass="pr-2">Position Offered</asp:Label>
                <asp:TextBox CssClass="form-control" runat="server" ID="PositionInput" ValidationGroup="vg" required></asp:TextBox>
            </div>
            <hr />
         <input class="form-control col-3" autocomplete="off" id="search" type="text" placeholder="Search here,.." />
        <br />
            <asp:Table ID="UpperHeirarchyTable" runat="server" CssClass="table">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell Scope="Column">Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell Scope="Column">Position</asp:TableHeaderCell>
                    <asp:TableHeaderCell Scope="Column">Supervisor</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <asp:Button runat="server" CssClass="btn btn-primary btn-lg mb-3" ValidationGroup="vg" Text="Add Employee" OnClick="AddEmployee_Click" />
            <div class="alert-warning">*The Employee will verify by mail his/her position before being added as an employee</div>
            <br />
            <br />
        </div>
    </div>
    <style>
        body {
            overflow-y: hidden;
        }
    </style>'=
    <script>
        $(document).ready(function () {
            $("#search").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("tr.r").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</asp:Content>

