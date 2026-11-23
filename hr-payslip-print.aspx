<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hr-payslip-print.aspx.cs" Title="طباعة قائمة الراتب" Inherits="adminmodeluniversitiy.hrdepartment.hr_payslip_print" MasterPageFile="~/genericmaster.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="dailystat">
       <link href="../assets/css/form.min.css" rel="stylesheet">
    <!-- Multi Select Css -->
<link href="../assets/js/bundles/multiselect/css/multi-select.css" rel="stylesheet">
<link href="../assets/css/style.css" rel="stylesheet">
    <style>
        .gridview-table th,
        .gridview-table td {
            text-align: center; /* توسيط المحتوى */
            vertical-align: middle; /* توسيط عمودي */
            white-space: nowrap; /* منع التفاف النص */
            padding: 8px 10px;
        }


        .gridview-table {
            width: 100%;
            border-collapse: collapse;
        }
    </style>

    <div class="body">
         <asp:ScriptManager ID="ScriptManager2" runat="server" />
        <section class="content">
            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <ul class="breadcrumb breadcrumb-style ">
                                <li class="breadcrumb-item">
                                    <h4 class="page-title">الموارد البشرية</h4>
                                </li>
                                <li class="breadcrumb-item bcrumb-1">
                                    <a href="../../index.html">
                                        <i class="fas fa-home"></i>طباعة قائمة الراتب</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">

                            <div class="header">
                                <h2>حدد الفترة الزمنية</h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                            <div class="form-line">

                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                              
                                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ExpencesAccSqlData"
                                                    CssClass="form-control select2" DataTextField="ContractName" DataValueField="ContractName" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="التصنيف" />
                                                </asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="ExpencesAccSqlData"
                                                    ConnectionString='<%$ ConnectionStrings:generalUniversityDB %>'
                                                    SelectCommand="SELECT distinct [ContractName] FROM [SalaryContactTypeTb] "></asp:SqlDataSource>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                                
                                                <asp:DropDownList ID="DropDownList1" runat="server"
                                                    CssClass="form-control select2" DataSourceID="sqlsalarydept" DataTextField="DepartmentName" DataValueField="DepartmentName" AppendDataBoundItems="true">

                                                    <asp:ListItem>*</asp:ListItem>
                                                    
                                                </asp:DropDownList>


                                                <asp:SqlDataSource runat="server" ID="sqlsalarydept" ConnectionString='<%$ ConnectionStrings:generalUniversityDBConnectionString11 %>' SelectCommand="SELECT distinct [DepartmentName] FROM [SalaryEmployeeBasicInfo]"></asp:SqlDataSource>
                                            </div>
     </div>

 </div>
                                    <div class="col-lg-5">

                                        <asp:Button ID="Button1" runat="server" Text="بحث" OnClick="Button1_Click" CssClass="btn btn-primary btn-lg m-l-15 waves-effect " />
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <!-- Exportable Table -->
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">

                            <div class="body">
                                <div class="table-responsive">


                                    <asp:GridView ID="tableExport" runat="server" OnRowCreated="tableExport_RowCreated" OnRowDataBound="tableExport_RowDataBound" ShowFooter="true"  CssClass="gridview-table display table table-bordered table-checkable order-column m-t-20 width-per-100"
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                        DataKeyNames="RowID">
                                           <Columns>
       <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="RowID" Visible="false">
                                                   <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowID") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
      <asp:TemplateField HeaderText="#">
                 <ItemTemplate>
                     <%# Container.DataItemIndex+1 %>
                 </ItemTemplate>
             </asp:TemplateField>
     <asp:BoundField DataField="GenerationRow" HeaderText="GenerationRow" SortExpression="GenerationRow" Visible="false" />
    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" Visible="false"/>
    <asp:BoundField DataField="SalaryDate" HeaderText="تاريخ التصدير" SortExpression="SalaryDate" DataFormatString="{0:d}" />
    <asp:BoundField DataField="EmployeeName" HeaderText="الاسم" SortExpression="EmployeeName" />
    <asp:BoundField DataField="TitleName" HeaderText="اللقب العلمي" SortExpression="TitleName"  Visible="false"/>
    <asp:BoundField DataField="EMPOS" HeaderText="الوظيفة" SortExpression="EMPPOS" ItemStyle-Width="50px" ItemStyle-Wrap="true"/>
    <asp:BoundField DataField="ContractType" HeaderText="ContractType" SortExpression="ContractType" Visible="false"/>
    <asp:BoundField DataField="SalaryClassification" HeaderText="SalaryClassification" SortExpression="SalaryClassification" Visible="false"/>
    <asp:BoundField DataField="DepartmentName" HeaderText="القسم" SortExpression="DepartmentName" Visible="false" />
    <asp:BoundField DataField="addedby" HeaderText="addedby" SortExpression="addedby" Visible="false"/>
    <asp:BoundField DataField="BasicSAlary" HeaderText="الراتب الاسمي" SortExpression="BasicSAlary" DataFormatString="{0:n0}" />
    <asp:BoundField DataField="CertificateAmount" HeaderText="الشهادة" SortExpression="CertificateAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="TitleAmount" HeaderText="اللقب العلمي" SortExpression="TitleAmount" DataFormatString="{0:n0}"/>
     <asp:BoundField DataField="FieldAmount" HeaderText="التخصص" SortExpression="FieldAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="PositionAmount" HeaderText="المنصب" SortExpression="PositionAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="OldestAmount" HeaderText="القدم" SortExpression="OldestAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="DangerAmount" HeaderText="الخطورة" SortExpression="DangerAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="TeacherAllocationAmount" HeaderText="حوافز تعليمية" SortExpression="TeacherAllocationAmount" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="FoodAllocation" HeaderText="بدل طعام" SortExpression="FoodAllocation" DataFormatString="{0:n0}" />
    <asp:BoundField DataField="otherAllocation" HeaderText="مستحقات اخرى" SortExpression="otherAllocation" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="TotalBasicSalary" HeaderText="الراتب الكلي" SortExpression="TotalBasicSalary" DataFormatString="{0:n0}"/>
    
    <asp:BoundField DataField="TotalAllocation" HeaderText="المخصصات الاضافية" SortExpression="TotalAllocation" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="TotalDeduction" HeaderText="الاستقاطع الكلي" SortExpression="TotalDeduction" DataFormatString="{0:n0}"/>
    <asp:BoundField DataField="AllocationNotes" HeaderText="تفاصيل المخصصات" SortExpression="AllocationNotes" />
    <asp:BoundField DataField="DeductionNotes" HeaderText="تفاصيل الاستقطاعات" SortExpression="DeductionNotes" />
      <asp:BoundField DataField="TotalSalary" HeaderText="صافي الراتب" SortExpression="TotalSalary" DataFormatString="{0:n0}"/>
     <asp:BoundField DataField="SalaryStatus" HeaderText="الحالة" SortExpression="SalaryStatus" />
    <asp:TemplateField HeaderText="تفاصيل الاستقطاع">
                  <ItemTemplate>
                      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DedDetailsSqlDataSource1">
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text='<%# Eval("DeductionName") %>' ></asp:Label>،&nbsp; قيمته :
                              <asp:Label ID="Label3" runat="server"  Text='<%# Eval("DeductionValue", "{0:n0}") %>'></asp:Label>،&nbsp; التفاصيل : (
                           <asp:Label ID="Label4" runat="server"  Text='<%# Eval("Comments") %>'></asp:Label>)
                              <br />
                          </ItemTemplate>

                      </asp:Repeater>
                      
                      <asp:SqlDataSource ID="DedDetailsSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountantModelConnectionString %>" 
                          SelectCommand="SELECT [DeductionName], [DeductionValue], [Comments] FROM [SalaryMonthlyDeduction] WHERE ([SalaryMonthlyRowID] = @SalaryMonthlyRowID)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="Label1" Name="SalaryMonthlyRowID"  Type="Int64" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                  </ItemTemplate>

                </asp:TemplateField>
     <asp:TemplateField HeaderText="تفاصيل المخصصات">
                  <ItemTemplate>
                      <asp:Repeater ID="Repeater2" runat="server" DataSourceID="AlletailsSqlDataSource1">
                          <ItemTemplate>
                              <asp:Label ID="Label22" runat="server" Text='<%# Eval("AllocationName") %>' ></asp:Label>،&nbsp; قيمته :
                              <asp:Label ID="Label33" runat="server"  Text='<%# Eval("AllocationValue", "{0:n0}") %>'></asp:Label>،&nbsp; التفاصيل : (
                           <asp:Label ID="Label44" runat="server"  Text='<%# Eval("Comments") %>'></asp:Label>)
                              <br />
                          </ItemTemplate>

                      </asp:Repeater>
                      
                      <asp:SqlDataSource ID="AlletailsSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountantModelConnectionString %>" 
                          SelectCommand="SELECT [AllocationName], [AllocationValue], [Comments] FROM [SalaryMonthlyAllocation] WHERE ([SalaryMonthlyRowID] = @SalaryMonthlyRowID)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="Label1" Name="SalaryMonthlyRowID"  Type="Int64" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                  </ItemTemplate>

                </asp:TemplateField>
    <asp:BoundField DataField="" HeaderText="توقيع المستلم" SortExpression="" />
    
   
</Columns>


                                    </asp:GridView>

                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountantModelConnectionString %>" 
      SelectCommand="SELECT SalarySystemMonthlyTb.RowID, SalarySystemMonthlyTb.GenerationRow, dbo.SalarySystemMonthlyTb.TotalBasicSalary, SalarySystemMonthlyTb.TotalSalary,  SalarySystemMonthlyTb.FieldAmount, 
      SalarySystemMonthlyTb.EmployeeID, dbo.SalaryEmployeeBasicInfo.TotalSalary as originalsal, SalarySystemMonthlyTb.TitleAmount, SalarySystemMonthlyTb.SalaryDate, SalarySystemMonthlyTb.EmployeeName, SalarySystemMonthlyTb.ContractType,
      SalarySystemMonthlyTb.SalaryClassification, SalarySystemMonthlyTb.DepartmentName, SalarySystemMonthlyTb.addedby, SalarySystemMonthlyTb.BasicSAlary, SalarySystemMonthlyTb.CertificateAmount, SalarySystemMonthlyTb.PositionAmount, SalarySystemMonthlyTb.OldestAmount,
      SalarySystemMonthlyTb.DangerAmount, CONCAT (SalaryEmployeeBasicInfo.EmpPosition,'-',SalarySystemMonthlyTb.DepartmentName) AS EMPOS, SalarySystemMonthlyTb.TeacherAllocationAmount, SalarySystemMonthlyTb.FoodAllocation, SalarySystemMonthlyTb.otherAllocation,
      SalarySystemMonthlyTb.TotalAllocation, SalarySystemMonthlyTb.DeductionSulaf, SalarySystemMonthlyTb.DeductionAbsence, SalarySystemMonthlyTb.TotalDeduction, SalarySystemMonthlyTb.AllocationNotes, SalarySystemMonthlyTb.DeductionNotes, CONCAT (SalaryEmployeeBasicInfo.EmpPosition,'-',SalarySystemMonthlyTb.DepartmentName) AS EMPPOS,
      SalaryEmployeeBasicInfo.TitleName, SalarySystemMonthlyTb.SalaryStatus FROM SalarySystemMonthlyTb INNER JOIN SalaryEmployeeBasicInfo ON SalarySystemMonthlyTb.EmployeeID = SalaryEmployeeBasicInfo.RowID
      WHERE (SalarySystemMonthlyTb.SalaryClassification = @classification) AND (SalarySystemMonthlyTb.SalaryDate BETWEEN @date1 AND @date2) 
      order by SalaryEmployeeBasicInfo.EmpPosition">
      <SelectParameters>
          <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="classification"></asp:ControlParameter>
          <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="date1"></asp:ControlParameter>
          <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="date2"></asp:ControlParameter>
      </SelectParameters>
  </asp:SqlDataSource>

  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AccountantModelConnectionString %>" 
      SelectCommand="SELECT SalarySystemMonthlyTb.RowID, SalarySystemMonthlyTb.GenerationRow, dbo.SalarySystemMonthlyTb.TotalBasicSalary, SalarySystemMonthlyTb.TotalSalary, SalarySystemMonthlyTb.FieldAmount, SalarySystemMonthlyTb.EmployeeID, dbo.SalaryEmployeeBasicInfo.TotalSalary as originalsal, SalarySystemMonthlyTb.TitleAmount, SalarySystemMonthlyTb.SalaryDate, SalarySystemMonthlyTb.EmployeeName, SalarySystemMonthlyTb.ContractType, SalarySystemMonthlyTb.SalaryClassification, SalarySystemMonthlyTb.DepartmentName, SalarySystemMonthlyTb.addedby, SalarySystemMonthlyTb.BasicSAlary, SalarySystemMonthlyTb.CertificateAmount, SalarySystemMonthlyTb.PositionAmount, SalarySystemMonthlyTb.OldestAmount, SalarySystemMonthlyTb.DangerAmount, SalarySystemMonthlyTb.TeacherAllocationAmount,
      CONCAT (SalaryEmployeeBasicInfo.EmpPosition,'-',SalarySystemMonthlyTb.DepartmentName) AS EMPOS, SalarySystemMonthlyTb.FoodAllocation, SalarySystemMonthlyTb.otherAllocation, SalarySystemMonthlyTb.TotalAllocation, SalarySystemMonthlyTb.DeductionSulaf, SalarySystemMonthlyTb.DeductionAbsence, SalarySystemMonthlyTb.TotalDeduction, SalarySystemMonthlyTb.AllocationNotes, SalarySystemMonthlyTb.DeductionNotes, CONCAT (SalaryEmployeeBasicInfo.EmpPosition,'-',SalarySystemMonthlyTb.DepartmentName), SalaryEmployeeBasicInfo.TitleName, SalarySystemMonthlyTb.SalaryStatus FROM SalarySystemMonthlyTb INNER JOIN SalaryEmployeeBasicInfo ON SalarySystemMonthlyTb.EmployeeID = SalaryEmployeeBasicInfo.RowID 
      WHERE (SalarySystemMonthlyTb.SalaryClassification = @classification) AND (SalarySystemMonthlyTb.SalaryDate BETWEEN @date1 AND @date2) AND (SalarySystemMonthlyTb.DepartmentName = @depatment) order by SalaryEmployeeBasicInfo.EmpPosition">
      <SelectParameters>
          <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="classification"></asp:ControlParameter>
          <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="date1"></asp:ControlParameter>
          <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="date2"></asp:ControlParameter>
          <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="depatment"></asp:ControlParameter>
      </SelectParameters>
  </asp:SqlDataSource>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Exportable Table -->
            </div>
        </section>

    </div>



 
    <script src="../assets/js/common.min.js"></script>
<script src="../assets/js/table.min.js"></script>
<script src="../assets/js/admin.js"></script>



<!-- Plugins Js -->
<%--<link href="../assets/js/bundles/export-tables/buttons.dataTables.min.css" rel="stylesheet" />--%>
<script src="../assets/js/pages/tables/jquery-datatable.js"></script>

<link href="../assets/css/bundles/export-tables/buttons.dataTables.min.css" rel="stylesheet" />
<script src="../assets/js/bundles/export-tables/dataTables.buttons.min.js"></script>
<script src="../assets/js/bundles/export-tables/buttons.html5.min.js"></script>
<script src="../assets/js/bundles/export-tables/buttons.print.min.js"></script>

<script src="../assets/js/bundles/export-tables/buttons.flash.min.js"></script>
<script src="../assets/js/bundles/export-tables/jszip.min.js"></script>
<!-- export pdf -->
<script src="../assets/js/bundles/export-tables/pdfmake.min.js"></script>
<script src="../assets/js/bundles/export-tables/vfs_fonts.js"></script>

<!-- arabic pdf fonts -->

<script src="../assets/js/bundles/export-tables/pdfFonts.js"></script>

    <!-- Demo Js -->

     <script type="text/javascript">

         Sys.Application.add_load(function () {
             $('.select2').each(function () {
                 // إزالة select2 السابقة إن وجدت
                 if ($(this).hasClass("select2-hidden-accessible")) {
                     $(this).select2('destroy');
                 }

                 // إعادة التهيئة
                 $(this).select2({
                     width: '100%',
                     placeholder: "اختر التصنيف",
                     placeholder: "",
                     allowClear: true
                 });
             });
         });

         $(document).ready(function () {
             var table = $('#<%= tableExport.ClientID %>').DataTable({
                 dom: 'Bfrtip',
                 language: {
                     url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/ar.json'
                 },
                 footerCallback: function (row, data, start, end, display) {
                     var api = this.api();

                     var intVal = function (i) {
                         return typeof i === 'string' ?
                             i.replace(/[\$,]/g, '').replace(/\s/g, '') * 1 :
                             typeof i === 'number' ? i : 0;
                     };

                     // مجموع العمود مدين (index 4)
                     var totalDebit = api
                         .column(7, { search: 'applied' })
                         .data()
                         .reduce(function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0);

                     // مجموع العمود دائن (index 5)
                     var totalCredit = api
                         .column(8, { search: 'applied' })
                         .data()
                         .reduce(function (a, b) {
                             return intVal(a) + intVal(b);
                         }, 0);

                     var totalBalance = totalDebit - totalCredit;

                     // وضع القيمة في خلايا الفوتر
                     $(api.column(7).footer()).html(totalDebit.toLocaleString());
                     $(api.column(8).footer()).html(totalCredit.toLocaleString());
                     $(api.column(9).footer()).html(totalBalance.toLocaleString());
                 },
                 buttons: [
                     { extend: 'copyHtml5', text: 'نسخ' },
                     { extend: 'excelHtml5', text: 'Excel' },
                     {
                         extend: 'print',
                         text: 'طباعة',
                         footer: true,
                         exportOptions: {
                             columns: ':visible',
                             stripHtml: false,
                             modifier: {
                                 page: 'all',
                                 search: 'none'
                             }
                         },
                         customize: function (win) {

                             // اتجاه الصفحة RTL ومحاذاة يمين


                             $(win.document.body)
                                 .css('direction', 'rtl')
                                 .css('text-align', 'right')
                                 .css('font-family', 'Tahoma, "Segoe UI", Arial');


                             // اعكس ترتيب الأعمدة بصريًا (اختياري لو تحب يمين>يسار)
                             $(win.document.body).find('table')
                                 .attr('dir', 'rtl')
                                 .addClass('compact')
                                 .css('font-size', '12px');

                             // رأس مطبوعات مخصص
                             var rptTitle = $('#<%= DropDownList1.ClientID %>').val();
                          var orgName = $('#<%= DropDownList2.ClientID %>').val();
      var dateFrom = $('#<%= TextBox1.ClientID %>').val() || '';
      var dateTo = $('#<%= TextBox2.ClientID %>').val() || '';


                             $(win.document.body).find('h1.dt-print-title').remove(); // ⬅️ إزالة العنوان قبل الجدول
                             // أضف هيدر غني قبل الجدول
                             $(win.document.body).prepend(
                                 '<div style="margin-bottom:15px; ">' +
                                 '<div style="margin-top:6px;">' +
                                 '<div><strong>تصنيف المنتسبين :</strong> ' + orgName + '</div>' +
                                 '<div><strong>الفترة:</strong> ' + (dateFrom || '—') + ' — ' + (dateTo || '—') + '</div>' +
                                 '<div><strong>تاريخ الطباعة:</strong> ' + new Date().toLocaleString() + '</div>' +
                                 '</div>' +
                                 '</div>'
                             );



                             // تحسين مظهر الجدول المطبوع
                             var $tbl = $(win.document.body).find('table');
                             $tbl.css('width', '100%');
                             $tbl.css('table-layout', 'fixed');
                             $tbl.find('thead th, tbody td').css({
                                 'text-align': 'right',
                                 'vertical-align': 'top',
                                 'white-space': 'normal',
                                 'word-wrap': 'break-word',
                                 'overflow-wrap': 'anywhere',
                                 'padding': '6px 8px'

                             });
                             // تأكد من ظهور الفوتر بوضوح
                             $tbl.find('tfoot').css({
                                 'display': 'table-row-group'


                             });

                             $tbl.find('tfoot th, tfoot td').css({
                                 'font-weight': 'bold',
                                 'border-top': '2px solid #000',
                                 'white-space': 'normal',
                                 'text-align': 'right'
                             });

                             var style = `
          <style>
              @page { size: A3 landscape; margin: 7mm; }

              thead { display: table-header-group; }

              table {
                  width: 100% !important;
                  table-layout: fixed !important;
              }

              th, td {
                  white-space: normal !important;
                  word-wrap: break-word !important;
                  overflow-wrap: anywhere !important;
                  word-break: break-word !important;
                  overflow: visible !important;
                  height: auto !important;
              }

              /* منع تكرار الفوتر بكل صفحة */
              tfoot {
                  display: table-row-group !important;
              }

              tfoot tr {
                  page-break-inside: avoid;
              }

              tfoot td, tfoot th {
                  font-weight: bold;
                  border-top: 2px solid #000;
                  background: #f3f3f3;
                  white-space: normal !important;
              }
          </style>
      `;

                             $(win.document.head).append(style);


                         }
                     },
                 ],

             });
         });

     </script>

     <!-- Plugins Js -->
 
 

    

      


</asp:Content>
