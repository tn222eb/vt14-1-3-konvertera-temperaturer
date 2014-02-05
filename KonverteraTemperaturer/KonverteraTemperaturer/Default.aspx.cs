using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KonverteraTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StartingTemperatureTextBox.Focus();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Variabler
                var startTemp = int.Parse(StartingTemperatureTextBox.Text);
                var finalTemp = int.Parse(FinalTemperatureTextBox.Text);
                var stepTemp = int.Parse(TemperatureStepTextBox.Text);

                // Flyttar plats på Celsius och Fahrenheit i tabellrubriken om Fahrenheit väljs
                if (FahrenheitToCelcius.Checked)
                {
                    HeaderCellLeft.Text = "&degF";
                    HeaderCellRight.Text = "&degC";
                }



                // For-loopar igenom värdena från textfälten för att bestämma antalet rader och kolumner i tabellen
                for (int i = startTemp; i <= finalTemp; i += stepTemp)
                {
                    TableRow tableRow = new TableRow();

                    TableCell[] tableCell = new TableCell[] 
                    {
                        new TableCell(), new TableCell() 
                    };
                    Table.Rows.Add(tableRow);
                    tableRow.Cells.AddRange(tableCell);

                    tableCell[0].Text = String.Format("{0}", i);

                    if (FahrenheitToCelcius.Checked)
                    {
                    tableCell[1].Text = String.Format("{0}", Model.TemperatureConverter.FahrenheitToCelsius(i));
                    }
                    else
                    {
                    tableCell[1].Text = String.Format("{0}", Model.TemperatureConverter.CelsiusToFahrenheit(i));
                    }
                }
                Table.Visible = true;
            }
        }
    }
}