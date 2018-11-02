Imports DevExpress.Web
Imports DevExpress.Web.Data

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        ASPxGridView1.DataSource = DataProvider.GetData()
        ASPxGridView1.DataBind()
    End Sub

    Protected Sub ASPxGridView1_BatchUpdate(sender As Object, e As ASPxDataBatchUpdateEventArgs)
        GetFormValues()
        For Each args As ASPxDataUpdateValues In e.UpdateValues
            UpdateItem(args.Keys, args.NewValues)
        Next
        ASPxGridView1.JSProperties("cpInfo") = "Submitted"
        e.Handled = True
    End Sub

    Private Sub GetFormValues()
        Dim firstName = ASPxFormLayout1.GetNestedControlValueByFieldName("FirstName")
        Dim lastName = ASPxFormLayout1.GetNestedControlValueByFieldName("LastName")
        Dim gender = ASPxFormLayout1.GetNestedControlValueByFieldName("Gender")
        Dim birthDate = ASPxFormLayout1.GetNestedControlValueByFieldName("BirthDate")
        Dim phoneNumber = ASPxFormLayout1.GetNestedControlValueByFieldName("PhoneNumber")
    End Sub

    Protected Sub ASPxGridView1_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        GetFormValues()
        ASPxGridView1.JSProperties("cpInfo") = "Submitted"
    End Sub
End Class