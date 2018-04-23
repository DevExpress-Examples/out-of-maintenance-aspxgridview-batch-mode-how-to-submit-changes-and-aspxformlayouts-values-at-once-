Imports DevExpress.Web
Imports DevExpress.Web.Data

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        ASPxGridView1.DataSource = GridDataItem.GetData()
        ASPxGridView1.DataBind()
    End Sub



    Protected Sub ASPxGridView1_BatchUpdate(sender As Object, e As ASPxDataBatchUpdateEventArgs)
        GetFormValues()
        For Each args As ASPxDataUpdateValues In e.UpdateValues
            UpdateItem(args.Keys, args.NewValues)
        Next
        TryCast(sender, ASPxGridView).JSProperties("cpInfo") = "Submitted"
        e.Handled = True
    End Sub

    Private Sub GetFormValues()
        Dim firstName = ASPxFormLayout1.GetNestedControlValueByFieldName("FirstName")
        Dim lastName = ASPxFormLayout1.GetNestedControlValueByFieldName("LastName")
        Dim gender = ASPxFormLayout1.GetNestedControlValueByFieldName("Gender")
        Dim birthDate = ASPxFormLayout1.GetNestedControlValueByFieldName("BirthDate")
        Dim phoneNumber = ASPxFormLayout1.GetNestedControlValueByFieldName("PhoneNumber")

    End Sub



    Protected Function UpdateItem(keys As OrderedDictionary, newValues As OrderedDictionary) As GridDataItem
        Dim id = Convert.ToInt32(keys("ID"))
        Dim item = GridDataItem.GetData().First(Function(i) i.ID = id)
        LoadNewValues(item, newValues)
        Return item
    End Function



    Protected Sub LoadNewValues(item As GridDataItem, values As OrderedDictionary)
        item.C1 = Convert.ToInt32(values("C1"))
        item.C2 = Convert.ToDouble(values("C2"))
        item.C3 = Convert.ToString(values("C3"))
        item.C4 = Convert.ToBoolean(values("C4"))
        item.C5 = Convert.ToDateTime(values("C5"))
    End Sub
    Protected Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewCommandButtonEventArgs)
        If e.ButtonType = DevExpress.Web.ColumnCommandButtonType.Cancel OrElse e.ButtonType = DevExpress.Web.ColumnCommandButtonType.Update Then
            e.Visible = False
        End If
    End Sub

    Protected Sub Callback_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgs)
        GetFormValues()
        e.Result = "Submitted"
    End Sub

End Class