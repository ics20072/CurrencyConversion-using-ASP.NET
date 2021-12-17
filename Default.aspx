<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Currency Conversion</title>
    <style type="text/css">
        .auto-style1 {
            width: auto;
            margin-right: 0px;
        }
        .auto-style4 {
            width: 70px;
            height: 15px;
        }
        .auto-style6 {
            width: 70px;
            text-align: center;
        }
        .auto-style7 {
            color: #9F0004;
        }
        .margin-style {
            margin-bottom: 0px;
            margin-top: 0px;
        }
        .newStyle1 {
        }
        .auto-style19 {
            width: 201px;
            height: 15px;
        }
        .auto-style20 {
            width: 201px;
        }
        .auto-style25 {
            width: 170px;
            height: 15px;
        }
        .auto-style26 {
            width: 170px;
        }
        .auto-style27 {
            width: 201px;
            height: 15px;
        }
        .auto-style28 {
            width: 201px;
        }
        .auto-style29 {
            text-align: left;
        }
        #ConversionButton {
            margin-left: 10%;
        }
        .auto-style30 {
            text-align: center;
        }
        #ConvertButton {
            cursor: pointer;
        }
        </style>
</head>
<body style="background-color: #E9E7DC">
    <form id="form1" runat="server">
        <h2>
        <asp:Label ID="Label1" runat="server" Text="Currency Conversion" style="font-weight: 700"></asp:Label>
        </h2>
        <hr />
        <div class="auto-style29">    
            <table class="auto-style1">
                <tr>
                    <td class="auto-style25">
                        <h3 class="margin-style">
                            <strong>
                                <asp:Label ID="Label2" runat="server" Text="Amount:"></asp:Label>
                            </strong>
                        </h3>
                    </td>
                    <td class="auto-style27">
                        <h3 class="margin-style">
                            <em>
                                <strong>
                                    <asp:Label ID="Label3" runat="server" Text="From:"></asp:Label>
                                </strong>
                            </em>
                        </h3>
                    </td>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">
                        <h3 class="margin-style">
                            <em>
                                <strong>
                                    <asp:Label ID="Label4" runat="server" Text="To:"></asp:Label>
                                </strong>
                            </em>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        <asp:TextBox ID="AmountToConvertInput" runat="server" BackColor="White" BorderColor="Black" Font-Names="Arial Black" Width="150px"></asp:TextBox>
                    </td>
                    <td class="auto-style28">
                        <asp:DropDownList ID="FromCurrency" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style6">
                        <asp:ImageButton ID="SwapButton" runat="server" Height="23px" ImageUrl="~/images/swap_35px.png" Width="30px" ToolTip="Swap" CssClass="newStyle1" OnClick="SwapButton_Click" />
                    </td>
                    <td class="auto-style20">
                        <asp:DropDownList ID="ToCurrency" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30" colspan="4">
                        <asp:Button ID="ConvertButton" runat="server" Text="Convert✅" BorderColor="Black" BorderStyle="Dotted" OnClick="ConvertButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <hr />
        <h4>
            <strong>
                <asp:Label ID="resultLabel" runat="server" Text="" CssClass="auto-style7"></asp:Label>
            </strong>
        </h4>
    </form>
</body>
</html>
