<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Predio.aspx.cs" Inherits="Web.Predio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 500px;">
        <tr>
            <td>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvwPredio" runat="server" DataSourceID="odsGvwGridView" DataKeyNames="Id"
                    OnSelectedIndexChanged="gvwPredio_SelectedIndexChanged" ShowHeaderWhenEmpty="True"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lkbEdit" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="Alterar"></asp:LinkButton>
                                <asp:LinkButton ID="lkbDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text="Excluir"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome" ControlStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblNome" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsGvwGridView" runat="server" SelectMethod="ObterTodos"
                    TypeName="Dados.Predio_DAL" DeleteMethod="Excluir">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnNovo" runat="server" Text="Novo" OnClick="BtnNovo_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="FvwPredio" runat="server" DataSourceID="OdsFvwPredio" Style="margin-right: 0px"
                    DataKeyNames="Id">
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Lbl" runat="server" Text="Codigo:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCodigo" runat="server" Text='<%# Bind("Id") %>' Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblNome" runat="server" Text="Nome:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNome" runat="server" Text='<%# Bind("Nome") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome"
                                        ErrorMessage="O campo nome é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    <asp:Button ID="btnAlterar" runat="server" Text="Salvar" CommandName="Update" />
                                </td>
                                <td>
                                    <asp:Button ID="BtnCancelar" runat="server" CausesValidation="false" CommandName="Cancel"
                                        OnClick="BtnCancelar_Click" Text="Cancelar" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="LblNome" runat="server" Text="Nome:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNome" runat="server" Text='<%# Bind("Nome") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome"
                                        ErrorMessage="O campo nome é obrigatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    <asp:Button ID="btnInserir" runat="server" CommandName="Insert" Text="Salvar" />
                                </td>
                                <td>
                                    <asp:Button ID="BtnCancelar" CausesValidation="false" runat="server" CommandName="Cancel"
                                        OnClick="BtnCancelar_Click" Text="Cancelar" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="OdsFvwPredio" runat="server" InsertMethod="Cadastrar" SelectMethod="Obter"
                    TypeName="Dados.Predio_DAL" UpdateMethod="Alterar" OnInserted="OdsFvwPredio_Inserted"
                    OnUpdated="OdsFvwPredio_Updated">
                    <InsertParameters>
                        <asp:Parameter Name="Nome" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvwPredio" Name="ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="Nome" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
