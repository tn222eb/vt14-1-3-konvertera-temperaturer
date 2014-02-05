<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonverteraTemperaturer.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera Temperaturer</title>
    <link href="~/Content/site.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SubmitButton">
        <h1>Konvertera temperaturer</h1>
        <%-- Tabell --%>  
        <asp:Table ID="Table" runat="server" Visible="false">
                <asp:TableHeaderRow>
                <asp:TableHeaderCell ID="HeaderCellLeft" Text="&degC"></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="HeaderCellRight" Text="&degF"></asp:TableHeaderCell>
                </asp:TableHeaderRow>
        </asp:Table>
        <%-- Textbox och validering --%>    
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fel inträffade. Åtgärda felen och försök igen." CssClass="field-validation-error" />
        <div>
            <span id="StartTemperatureLabel">Starttemperatur</span> <br />
            <asp:TextBox ID="StartingTemperatureTextBox" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Fyll i ett heltal" Display="Dynamic" Type="Integer" Operator="DataTypeCheck" ControlToValidate="StartingTemperatureTextBox" Text="*" CssClass="field-validation-error"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i en starttemperatur" ControlToValidate="StartingTemperatureTextBox" Display="Dynamic" Text="*" CssClass="field-validation-error"></asp:RequiredFieldValidator>
        </div>
        <div>
            <span id="FinalTemperatureLabel">Slutttemperatur</span> <br />
            <asp:TextBox ID="FinalTemperatureTextBox" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Fyll i ett heltal" Display="Dynamic" Type="Integer" Operator="DataTypeCheck" ControlToValidate="FinalTemperatureTextBox" Text="*" CssClass="field-validation-error"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i sluttemperaturen" ControlToValidate="FinalTemperatureTextBox" Display="Dynamic" Text="*" CssClass="field-validation-error"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="FinalTemperatureTextBox" ControlToCompare="StartingTemperatureTextBox" Operator="GreaterThanEqual" Type="Integer" ErrorMessage="Sluttemperaturen måste vara högre än starttemperaturen" Display="Dynamic" Text="*" CssClass="field-validation-error"></asp:CompareValidator>    
        </div>
        <div>
            <span id="TemperatureStepLabel">Temperatursteg</span> <br />
            <asp:TextBox ID="TemperatureStepTextBox" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Fyll i ett heltal" Display="Dynamic" Type="Integer" Operator="DataTypeCheck" ControlToValidate="TemperatureStepTextBox" Text="*" CssClass="field-validation-error"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fyll i ett temperatursteg" ControlToValidate="TemperatureStepTextBox" Display="Dynamic" Text="*" CssClass="field-validation-error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Temperatursteget måste ligga mellan 1 och 100." Display="Dynamic" ControlToValidate="TemperatureStepTextBox" MaximumValue="100" MinimumValue="1" Type="Integer" Text="*" CssClass="field-validation-error"></asp:RangeValidator>
        </div>
            <%-- Radioknappar --%>   
            <span id="Type">Typ av konvertering</span> <br />
            <asp:RadioButton ID="CelciusToFahrenheit" Text="Celcius till Fahrenheit" runat="server" GroupName="RadioButton" Checked="true"/> <br />
            <asp:RadioButton ID="FahrenheitToCelcius" Text="Fahrenheit till Celcius" runat="server" GroupName="RadioButton" />    

            <%-- Kommandoknapp --%>
            <div>
                <asp:Button ID="SubmitButton" runat="server" Text="Konvertera" OnClick="SubmitButton_Click" />
            </div>
            </div>
    </form>
</body>
</html>
