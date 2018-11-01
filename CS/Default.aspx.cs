using System;
using DevExpress.Web.Data;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {

    protected void Page_Init(object sender, EventArgs e) {
        ASPxGridView1.DataSource = DataProvider.GetData();
        ASPxGridView1.DataBind();
    }

    protected void ASPxGridView1_BatchUpdate(object sender, ASPxDataBatchUpdateEventArgs e) {
        GetFormValues();
        foreach (var args in e.UpdateValues)
            DataProvider.UpdateItem(args.Keys, args.NewValues);
        ASPxGridView1.JSProperties["cpInfo"] = "Submitted";
        e.Handled = true;
    }

    protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        GetFormValues();
        ASPxGridView1.JSProperties["cpInfo"] = "Submitted";
    }

    private void GetFormValues() {
        var firstName = ASPxFormLayout1.GetNestedControlValueByFieldName("FirstName");
        var lastName = ASPxFormLayout1.GetNestedControlValueByFieldName("LastName");
        var gender = ASPxFormLayout1.GetNestedControlValueByFieldName("Gender");
        var birthDate = ASPxFormLayout1.GetNestedControlValueByFieldName("BirthDate");
        var phoneNumber = ASPxFormLayout1.GetNestedControlValueByFieldName("PhoneNumber");
    }   
}