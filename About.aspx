<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Aps.net GridView with add button to add new row into a grid.</h3>
        <p>Use this area to provide additional information.</p>

        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="Static">
                <Columns>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <select class="country">
                                <option value="USA">USA</option>
                                <option value="Canada">Canada</option>
                                <option value="UK">UK</option>
                            </select>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <input type="text" class="productName" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <input type="text" class="unitPrice" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <input type="text" class="quantity" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Price">
                        <ItemTemplate>
                            <input type="text" class="totalPrice" readonly="readonly" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnAddRow" runat="server" ClientIDMode="Static" Text="Add Row" CssClass="btn btn-outline-success btn-sm" OnClientClick="return false;" />
        </div>

    </main>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Event to add a new row
            $("#btnAddRow").click(function () {
                debugger
                alert("test");
                // Clone the last row
                var newRow = $("#GridView1 tr:last").clone();

                // Clear the input fields in the cloned row
                newRow.find("input[type='text']").val("");
                newRow.find("select").val("");

                // Append the new row to the GridView
                $("#GridView1").append(newRow);

                // Attach change event to new quantity and unit price fields
                attachChangeEvent();
            });

            // Attach change event to calculate total price
            function attachChangeEvent() {
                $(".quantity, .unitPrice").off('input').on('input', function () {
                    debugger
                    var row = $(this).closest("tr");
                    var unitPrice = parseFloat(row.find(".unitPrice").val()) || 0;
                    var quantity = parseInt(row.find(".quantity").val()) || 0;
                    var totalPrice = unitPrice * quantity;
                    row.find(".totalPrice").val(totalPrice.toFixed(2));
                });
            }

            // Initial attachment of change event
            attachChangeEvent();
        });
    </script>
</asp:Content>
