<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function onSubmit(s, e) {
            if (grid.batchEditApi.HasChanges())
                grid.UpdateEdit();
            else callback.PerformCallback();

        }
        function onCancel(s, e) {
            grid.CancelEdit();
            ASPxClientEdit.ClearEditorsInContainer(formLayout.GetMainElement());
        }
        var command;
        function EndCallback(s, e) {
                lblInfo.SetText(s.cpInfo);
        }
        function Callback_CallbackComplete(s, e) {
            lblInfo.SetText(e.result);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCallback runat="server" ID="Callback" ClientInstanceName="callback" OnCallback="Callback_Callback">
                <ClientSideEvents  CallbackComplete="Callback_CallbackComplete" />
            </dx:ASPxCallback>
            <dx:ASPxLabel runat="server" ID="Info" ClientInstanceName="lblInfo" Font-Size="X-Large" ForeColor="Red"> 
            </dx:ASPxLabel>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ClientInstanceName="formLayout" AlignItemCaptionsInAllGroups="True">
                <Items>
                    <dx:LayoutGroup Caption="Personal Information" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="First Name" FieldName="FirstName">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="firstNameTextBox" runat="server" Width="200px" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name" FieldName="LastName">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="lastNameTextBox" runat="server" Width="200px" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Gender" FieldName="Gender">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxRadioButtonList ID="genderRadioButtonList" runat="server" RepeatDirection="Horizontal">
                                            <Items>
                                                <dx:ListEditItem Text="Male" Value="Male" />
                                                <dx:ListEditItem Text="Female" Value="Female" />
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Birth Date" FieldName="BirthDate">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxDateEdit ID="birthDateEdit" runat="server" Width="200px" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Location" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="Country" FieldName="Country">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize"
                                            KeyFieldName="ID" OnBatchUpdate="ASPxGridView1_BatchUpdate">
                                            <SettingsEditing Mode="Batch" />
                                            <Settings ShowStatusBar="Hidden" />
                                            <Columns>
                                                <dx:GridViewDataColumn FieldName="C1" />
                                                <dx:GridViewDataSpinEditColumn FieldName="C2" />
                                                <dx:GridViewDataTextColumn FieldName="C3" />
                                                <dx:GridViewDataCheckColumn FieldName="C4" />
                                                <dx:GridViewDataDateColumn FieldName="C5" />
                                            </Columns>
                                            <ClientSideEvents EndCallback="EndCallback" />
                                        </dx:ASPxGridView>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phone Number" FieldName="PhoneNumber">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="phoneNumberTestBox" runat="server" Width="200px">
                                            <MaskSettings Mask="(999) 999-9999" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right" Width="100">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButton ID="submitButton" ClientInstanceName="submitButton" runat="server" Text="Submit" Width="100" AutoPostBack="false">
                                    <ClientSideEvents Click="onSubmit" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right" Width="100">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButton ID="cancelButton" runat="server" Text="Cancel" Width="100" AutoPostBack="false">
                                    <ClientSideEvents Click="onCancel" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>

        </div>
    </form>
</body>
</html>
