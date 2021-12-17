using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    lt.lb.www.ExchangeRates myWebService = new lt.lb.www.ExchangeRates();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false) //// if this is the first time the page has loaded
        {
            XmlNode node = myWebService.getListOfCurrencies();
            //the XML nodes inside the root are of the <item> format
            XmlNodeList nodes = node.SelectNodes("//item");
            //// Pass the xml nodes and put any fields we want in the drop-down lists
            foreach (XmlNode nd in nodes)
            {
                FromCurrency.Items.Add(nd["currency"].InnerText + " " + nd["description"].InnerText);
                ToCurrency.Items.Add(nd["currency"].InnerText + " " + nd["description"].InnerText);
            }
            FromCurrency.SelectedIndex = 26; //initialize the first list in Euro
            ToCurrency.SelectedIndex = 87; //we initialize the second list in US Dollar
        }
    }

    protected void ConvertButton_Click(object sender, EventArgs e)
    {
        if ((AmountToConvertInput.Text).Trim() != "")
        {
            string fixedInput = (AmountToConvertInput.Text).Replace('.', ','); //We replace the . with , because in the service demicals seperated with ","
            decimal result, rateFrom = 0, rateTo = 0, givenAmountDemical = Convert.ToDecimal(fixedInput); //Convert the String input to demical
            string currencyFrom, currencyTo;

            AmountToConvertInput.BorderColor = System.Drawing.Color.Black;
            currencyFrom = Convert.ToString(FromCurrency.SelectedItem).Substring(0, 3);
            currencyTo = Convert.ToString(ToCurrency.SelectedItem).Substring(0, 3);
            //This free Web Service is for historical purposes only
            XmlNode node = myWebService.getExchangeRatesByDate("2014-12-31");
            XmlNodeList nodes = node.SelectNodes("//item");
            foreach (XmlNode nde in nodes)
            {
                if (nde["currency"].InnerText == currencyFrom)
                    rateFrom = Convert.ToDecimal(nde["rate"].InnerText) / Convert.ToInt32(nde["quantity"].InnerText);
                if (nde["currency"].InnerText == currencyTo)
                    rateTo = Convert.ToDecimal(nde["rate"].InnerText) / Convert.ToInt32(nde["quantity"].InnerText);
            }
            //accuracy of 2 decimal places
            result = Math.Round(givenAmountDemical * rateFrom / rateTo, 2);
            resultLabel.Text = Convert.ToString(givenAmountDemical + " (" + currencyFrom + ") = " + result + " (" + currencyTo + ")");
        }
        else
        {
            AmountToConvertInput.BorderColor = System.Drawing.Color.Red;
            resultLabel.Text = "";
        }
    }

    protected void SwapButton_Click(object sender, ImageClickEventArgs e)
    {
        //invert the selected position in the lists
        int indexOfFrom = FromCurrency.Items.IndexOf(FromCurrency.SelectedItem);
        int indexOfTo = ToCurrency.Items.IndexOf(ToCurrency.SelectedItem);
        int tempIndex = indexOfFrom;

        FromCurrency.SelectedIndex = indexOfTo;
        ToCurrency.SelectedIndex = tempIndex;
        resultLabel.Text = "";
        AmountToConvertInput.Text = "";
    }
}