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
                     placeholder: "اختر حساب",
                     placeholder: "",
                     allowClear: true
                 });
             });
         });

         function escapeHtml(value) {
             return String(value == null ? '' : value)
                 .replace(/&/g, '&amp;')
                 .replace(/</g, '&lt;')
                 .replace(/>/g, '&gt;')
                 .replace(/"/g, '&quot;');
         }

         function applyPrintColumnWidths($table) {
             var $headerCells = $table.find('thead th');
             if (!$headerCells.length) {
                 $headerCells = $table.find('tr').first().children('th, td');
             }

             var weights = [];
             var total = 0;
             $headerCells.each(function () {
                 var text = $(this).text().replace(/\s+/g, ' ').trim();
                 var weight = 0.8;
                 if (text === '#' || text.length === 0) {
                     weight = 0.45;
                 } else if (/توقيع/.test(text)) {
                     weight = 1.25;
                 } else if (/تفاصيل|ملاحظات/.test(text)) {
                     weight = 2.3;
                 } else if (/الاسم/.test(text)) {
                     weight = 1.7;
                 } else if (/الوظيفة|القسم/.test(text)) {
                     weight = 1.55;
                 } else if (/تاريخ|الحالة/.test(text)) {
                     weight = 0.95;
                 }
                 weights.push(weight);
                 total += weight;
             });

             if (!weights.length || !total) {
                 return;
             }

             var cols = weights.map(function (weight) {
                 return '<col style="width:' + ((weight / total) * 100).toFixed(2) + '%">';
             }).join('');

             $table.find('colgroup').remove();
             $table.prepend('<colgroup>' + cols + '</colgroup>');
         }

         function preparePrintTable($table) {
             $table.removeAttr('id');
             $table.find('[id]').removeAttr('id');
             $table.removeAttr('style');
             $table.attr('dir', 'rtl');
             $table.find('th, td').each(function () {
                 this.style.whiteSpace = 'normal';
                 this.style.wordBreak = 'break-word';
                 this.style.overflowWrap = 'anywhere';
                 this.style.overflow = 'visible';
                 this.style.textOverflow = 'clip';
                 this.style.width = 'auto';
                 this.style.maxWidth = 'none';
                 this.style.height = 'auto';
             });
             $table.find('.sorting, .sorting_asc, .sorting_desc')
                 .removeClass('sorting sorting_asc sorting_desc');
             applyPrintColumnWidths($table);
         }

         function printAllGridViews() {
             var $tables = $('table.gridview-table').filter(function () {
                 return $(this).closest('.dataTables_scrollHead, .dataTables_scrollFoot').length === 0;
             });

             if (!$tables.length) {
                 window.alert('لا توجد جداول للطباعة');
                 return;
             }

             var restores = [];
             var sections = [];

             try {
                 $tables.each(function () {
                     var $table = $(this);
                     if ($.fn.dataTable && $.fn.dataTable.isDataTable(this)) {
                         var dt = $table.DataTable();
                         var info = dt.page.info();
                         var previousLength = info.length;
                         var previousPage = info.page;
                         var previousSearch = dt.search();
                         var rowCount = dt.rows({ search: 'none' }).count();
                         restores.push(function () {
                             dt.search(previousSearch).page.len(previousLength).page(previousPage).draw(false);
                         });
                         dt.search('').page.len(rowCount > 0 ? rowCount : -1).draw(false);
                     }

                     var $clone = $table.clone();
                     preparePrintTable($clone);
                     sections.push($clone.prop('outerHTML'));
                 });
             } finally {
                 restores.forEach(function (restore) {
                     restore();
                 });
             }

             var classification = $('#<%= DropDownList2.ClientID %>').val() || '';
             var department = $('#<%= DropDownList1.ClientID %>').val() || '';
             var dateFrom = $('#<%= TextBox1.ClientID %>').val() || '';
             var dateTo = $('#<%= TextBox2.ClientID %>').val() || '';
             if (!department || department === '*') {
                 department = 'الكل';
             }

             var html = ''
                 + '<!DOCTYPE html>'
                 + '<html lang="ar" dir="rtl">'
                 + '<head>'
                 + '<meta charset="utf-8">'
                 + '<title>طباعة قائمة الراتب</title>'
                 + '<style>'
                 + '@page { size: A3 landscape; margin: 7mm; }'
                 + '* { box-sizing: border-box; }'
                 + 'html, body { margin: 0; padding: 0; direction: rtl; text-align: right; color: #000; background: #fff; font-family: Tahoma, "Segoe UI", Arial, sans-serif; }'
                 + '.print-header { margin: 0 0 8px; }'
                 + '.print-header h1 { margin: 0 0 6px; font-size: 16pt; text-align: center; }'
                 + '.meta { display: flex; flex-wrap: wrap; justify-content: space-between; gap: 4px 18px; font-size: 10pt; }'
                 + 'table { width: 100% !important; max-width: 100% !important; border-collapse: collapse !important; table-layout: fixed !important; direction: rtl; page-break-after: auto; }'
                 + 'th, td { border: 0.6pt solid #000 !important; padding: 3px 4px !important; vertical-align: top !important; text-align: center !important; white-space: normal !important; word-wrap: break-word !important; overflow-wrap: anywhere !important; word-break: break-word !important; overflow: visible !important; text-overflow: clip !important; height: auto !important; max-width: none !important; font-size: 8.5pt !important; line-height: 1.35 !important; }'
                 + 'thead { display: table-header-group; }'
                 + 'thead th { background: #e8eef6 !important; font-weight: bold; font-size: 8pt !important; -webkit-print-color-adjust: exact; print-color-adjust: exact; }'
                 + 'tfoot { display: table-row-group; }'
                 + 'tfoot th, tfoot td { font-weight: bold; background: #f3f3f3 !important; -webkit-print-color-adjust: exact; print-color-adjust: exact; }'
                 + 'thead tr { page-break-inside: avoid; break-inside: avoid; }'
                 + 'table.dataTable thead .sorting:before, table.dataTable thead .sorting:after,'
                 + 'table.dataTable thead .sorting_asc:before, table.dataTable thead .sorting_asc:after,'
                 + 'table.dataTable thead .sorting_desc:before, table.dataTable thead .sorting_desc:after { content: none !important; display: none !important; }'
                 + '</style>'
                 + '</head>'
                 + '<body>'
                 + '<div class="print-header">'
                 + '<h1>قائمة الراتب</h1>'
                 + '<div class="meta">'
                 + '<div><strong>التصنيف:</strong> ' + escapeHtml(classification) + '</div>'
                 + '<div><strong>القسم:</strong> ' + escapeHtml(department) + '</div>'
                 + '<div><strong>الفترة:</strong> ' + escapeHtml(dateFrom || '—') + ' — ' + escapeHtml(dateTo || '—') + '</div>'
                 + '<div><strong>تاريخ الطباعة:</strong> ' + escapeHtml(new Date().toLocaleString()) + '</div>'
                 + '<div><strong>مقاس الورق:</strong> A3 أفقي</div>'
                 + '</div>'
                 + '</div>'
                 + sections.join('<div style="height:12px"></div>')
                 + '<script>window.onload=function(){window.focus();window.print();};<\/script>'
                 + '</body></html>';

             var printWindow = window.open('', '_blank');
             if (!printWindow) {
                 window.alert('يرجى السماح بالنوافذ المنبثقة حتى تتم الطباعة');
                 return;
             }

             printWindow.document.open();
             printWindow.document.write(html);
             printWindow.document.close();
         }


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
                         text: 'طباعة',
                         action: function () {
                             printAllGridViews();
                         }
                     },
                 ],

             });
         });

     </script>

     <!-- Plugins Js -->
 
 

    

      


</asp:Content>
