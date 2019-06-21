<!-- default file list -->
*Files to look at*:

* [GridDataItem.cs](./CS/App_Code/Models/GridDataItem.cs)
* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/T510345_VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/T510345_VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - Batch Mode - How to submit changes and the ASPxFormLayout’s values at once
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t510345/)**
<!-- run online end -->


This example illustrates how to submit changes made in ASPxGridView and ASPxFormLayout’s values at the same time. This task can be done by performing the following steps:

1.Place the submit button onto the form and handle its client-side Click event. In this event handler, you can validate the ASPxFormLayout's values before submitting the form using the [ASPxClientEdit.ValidateEditorsInContainer](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientEdit.ValidateEditorsInContainer.overloads) method:
```js
if (!ASPxClientEdit.ValidateEditorsInContainer(formLayout.GetMainElement())) return;
```
Then, you can determine whether changes have been made in ASPxGridView using the [ASPxClientGridViewBatchEditApi.HasChanges](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientGridViewBatchEditApi.HasChanges.overloads) method. If so, call the [ASPxClientGridView.UpdateEdit](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientGridView.UpdateEdit.method) method to save changes in the grid. Otherwise, call the [ASPxClientGridView.PerformCallback](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientGridView.PerformCallback.overloads) method to send a custom callback to the server.
2. On the server side, you can access values of ASPxFormLayout  in the [ASPxGridView.BatchUpdate](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxGridBase.BatchUpdate.event) or [ASPxGridView.CustomCallback](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomCallback.event) event handler using the [GetNestedControlValueByFieldName](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxFormLayout.GetNestedControlValueByFieldName.method) method. For example:
```csharp
var firstName = ASPxFormLayout1.GetNestedControlValueByFieldName("FirstName");
```
3.The last part of the example is the cancel button which is used to clear changes made in the ASPxGridView and ASPxFormLayout controls. For this, call the corresponding [ASPxClientGridView.CancelEdit](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientGridView.CancelEdit.method) and [ASPxClientEdit.ClearEditorsInContainer](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientEdit.ClearEditorsInContainer.overloads) methods:

```js
function onCancel(s, e) {
            grid.CancelEdit();
            ASPxClientEdit.ClearEditorsInContainer(formLayout.GetMainElement());
        }
```

**Starting with version 17.2**, we implemented the [ASPxClientEdit.AttachEditorModificationListener](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientEdit.AttachEditorModificationListener.method) method which allows you to attach a handler to the ASPxClientEdit's event which indicates whether a user modified the ASPxFormLayout's field values since the previous save. This allows you to change the submit and cancel button's visibility.
