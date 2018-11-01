<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function onSubmit(s, e) {
            if (!ASPxClientEdit.ValidateEditorsInContainer(formLayout.GetMainElement())) return;

            if (grid.batchEditApi.HasChanges())
                grid.UpdateEdit();
            else grid.PerformCallback();
        }

        function onCancel(s, e) {
            grid.CancelEdit();
            ASPxClientEdit.ClearEditorsInContainer(formLayout.GetMainElement());
        }

        function EndCallback(s, e) {
            if (s.cpInfo) {
                lblInfo.SetText(s.cpInfo);
                delete s.cpInfo;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: inline-block">
            <dx:ASPxLabel runat="server" ID="Info" ClientInstanceName="lblInfo" Font-Size="X-Large" ForeColor="Green"> 
            </dx:ASPxLabel>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ClientInstanceName="formLayout" AlignItemCaptionsInAllGroups="True" Width="520px">
                <Items>
                    <dx:LayoutGroup Caption="Main Information">
                        <Items>
                            <dx:LayoutItem Caption="First Name" FieldName="FirstName">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="firstNameTextBox" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                                                <RequiredField IsRequired="true" ErrorText="The First Name is required." />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name" FieldName="LastName">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="lastNameTextBox" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="true">
                                                <RequiredField IsRequired="true" ErrorText="The Last Name is required." />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
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
                                            <Paddings PaddingLeft="0" />
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
                    <dx:LayoutGroup Caption="Details">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid"
                                            KeyFieldName="ID"
                                            OnBatchUpdate="ASPxGridView1_BatchUpdate"
                                            OnCustomCallback="ASPxGridView1_CustomCallback">
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
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
            <div style="text-align: right; padding: 2px">
                <dx:ASPxButton ID="submitButton" ClientInstanceName="submitButton" runat="server" RenderMode="Link" AutoPostBack="false">
                    <ClientSideEvents Click="onSubmit" />
                    <Image IconID="actions_apply_32x32office2013"></Image>
                </dx:ASPxButton>
                <dx:ASPxButton ID="cancelButton" ClientInstanceName="cancelButton" runat="server" RenderMode="Link" AutoPostBack="false">
                    <ClientSideEvents Click="onCancel" />
                    <Image IconID="actions_cancel_32x32office2013"></Image>
                </dx:ASPxButton>
            </div>
        </div>
    </form>
</body>
</html>
