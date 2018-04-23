using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using DevExpress.Web.Data;
using System.Diagnostics;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void Page_Init(object sender, EventArgs e) {
        ASPxGridView1.DataSource = GridDataItem.GetData();
        ASPxGridView1.DataBind();
    }

    protected void ASPxGridView1_BatchUpdate(object sender, ASPxDataBatchUpdateEventArgs e) {
        GetFormValues();
        foreach (var args in e.UpdateValues)
            UpdateItem(args.Keys, args.NewValues);
        (sender as ASPxGridView).JSProperties["cpInfo"] = "Submitted";
        e.Handled = true;
    }

    private void GetFormValues() {
        var firstName = ASPxFormLayout1.GetNestedControlValueByFieldName("FirstName");
        var lastName = ASPxFormLayout1.GetNestedControlValueByFieldName("LastName");
        var gender = ASPxFormLayout1.GetNestedControlValueByFieldName("Gender");
        var birthDate = ASPxFormLayout1.GetNestedControlValueByFieldName("BirthDate");
        var phoneNumber = ASPxFormLayout1.GetNestedControlValueByFieldName("PhoneNumber");
        
    }



    protected GridDataItem UpdateItem(OrderedDictionary keys, OrderedDictionary newValues) {
        var id = Convert.ToInt32(keys["ID"]);
        var item = GridDataItem.GetData().First(i => i.ID == id);
        LoadNewValues(item, newValues);
        return item;
    }



    protected void LoadNewValues(GridDataItem item, OrderedDictionary values) {
        item.C1 = Convert.ToInt32(values["C1"]);
        item.C2 = Convert.ToDouble(values["C2"]);
        item.C3 = Convert.ToString(values["C3"]);
        item.C4 = Convert.ToBoolean(values["C4"]);
        item.C5 = Convert.ToDateTime(values["C5"]);
    }
    protected void ASPxGridView1_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e) {
        if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Cancel || e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Update) {
            e.Visible = false;
        }
    }

    protected void Callback_Callback(object sender, DevExpress.Web.CallbackEventArgs e) {
        GetFormValues();
        e.Result = "Submitted";
    }
}