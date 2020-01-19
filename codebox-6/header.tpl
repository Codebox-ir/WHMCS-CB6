<!DOCTYPE html><html lang="en">
  <head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WHMCS - {$pagetitle}</title>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">
    <link href="templates/{$template}/css/all.min.css?v={$versionHash}" rel="stylesheet" />
    <link href="templates/{$template}/css/cb.css?v={$versionHash}" rel="stylesheet" />
    <link href="{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}/assets/css/fontawesome-all.min.css" rel="stylesheet" />
    <script type="text/javascript" src="templates/{$template}/js/scripts.min.js?v={$versionHash}"></script>
    <script>
        var datepickerformat = "{$datepickerformat}",
            csrfToken="{$csrfToken}",
            adminBaseRoutePath = "{\WHMCS\Admin\AdminServiceProvider::getAdminRouteBase()}";
            whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
        {if $jquerycode}
            $(document).ready(function(){ldelim}
                {$jquerycode}
            {rdelim});
        {/if}
        {if $jscode}
            {$jscode}
        {/if}
    </script>
    {$headoutput}
</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}
    <div class="topbar">      
    <div class="pull-left">
      <div id="sidebaropen"{if !$minsidebar} style="display:none;"{/if}>
          <a href="#" onclick="sidebarOpen();document.getElementById('sidebarclose').style.display = 'block';return false"> <i class="fas fa-chevron-right"></i> <i class="fas fa-bars"></i></a>
      </div>
      <div id="sidebarclose" {if $minsidebar} style="display:none;"{/if}>
        <a href="#" onclick="sidebarClose();document.getElementById('sidebarclose').style.display = 'none';return false"> <i class="fas fa-chevron-left"></i> <i class="fas fa-bars"></i></a>
      </div>
      <div class="logo">
        <a href="index.php"><img src="https://cdn.codebox.ir/codebox/image/codebox-logo.png" border="0" /></a>
      </div>
      {$topBarNotification}
    </div>
    <div class="pull-right">
      <a href="#" data-toggle="modal" data-target="#myNotes">{$_ADMINLANG.global.mynotes}</a> |
      <a href="myaccount.php">{$_ADMINLANG.global.myaccount}</a> |
      <a id="logout" href="logout.php"><img src="https://cdn.codebox.ir/codebox/image/logout.png" alt="Codebox" /> {$_ADMINLANG.global.logout} </a>
    </div>
    <div class="pull-left date">
      {$smarty.now|date_format:"%A, %d %B %Y"}
    </div>
    <div class="pull-right date">
      <span id="jalali">{$CB_JALALI}</span>
    </div>

    <div class="stats">
      <a href="orders.php?status=Pending">
        <i class="fas fa-2x fa-fw fa-shopping-cart"></i>
{if $sidebarstats.orders.pending}
        <span class="stat">{$sidebarstats.orders.pending}</span>
{else}
        0
{/if}
      </a>
      <a href="invoices.php?status=Overdue">
        <i class="fas fa-2x fa-fw fa-calculator"></i>
{if $sidebarstats.invoices.overdue}
        <span class="stat">{$sidebarstats.invoices.overdue}</span>
{else}
        0
{/if}
      </a>
      <a href="supporttickets.php">
        <i class="far fa-2x fa-fw fa-life-ring"></i> 
{if $sidebarstats.tickets.awaitingreply} 
        <span class="stat">{$sidebarstats.tickets.awaitingreply}</span>
{else}
        0
{/if}
      </a>
    </div>

  </div>
  <div class="clearfix"></div>

  <div class="cb-ticketbar">
    <div class="col-sm-5 text-center">
      <input type="number" class="idinp cb-inid" placeholder="ID...">
      <span class="btn btn-success btn-sm cb-ids">Service</span>
      <span class="btn btn-info btn-sm cb-idi">Invoice</span>
      <span class="btn btn-default btn-sm cb-ido">Order</span>
      <span class="btn btn-primary btn-sm cb-idc">Client</span>
    </div>
    <script>
      $(".cb-ids").click(function(){
          var inputid = $( ".cb-inid" ).val();
          window.location.href = "https://codebox.ir/support/in6/clientshostinglist.php?id="+inputid;
      });
      $(".cb-idi").click(function(){
          var inputid = $( ".cb-inid" ).val();
          window.location.href = "https://codebox.ir/support/in6/invoices.php?action=edit&id="+inputid;
      });
      $(".cb-ido").click(function(){
          var inputid = $( ".cb-inid" ).val();
          window.location.href = "https://codebox.ir/support/in6/orders.php?action=view&id="+inputid;
      });
      $(".cb-idc").click(function(){
          var inputid = $( ".cb-inid" ).val();
          window.location.href = "https://codebox.ir/support/in6/clientssummary.php?userid="+inputid;
      });
    </script>
    <div class="col-sm-7 text-center">
      <a href="supporttickets.php?view=active">
          <span class="stat">{$sidebarstats.tickets.active}</span>
          Active
      </a>&nbsp;&nbsp;&nbsp;&loz;&nbsp;&nbsp;&nbsp;
      <a href="supporttickets.php?view=In%20Progress">
          <span class="stat">{$ticketsinprogress}</span>
          In Progress
      </a>&nbsp;&nbsp;&nbsp;&loz;&nbsp;&nbsp;&nbsp;
      <a href="supporttickets.php?view=On%20Hold">
          <span class="stat">{$ticketsonhold}</span>
          On Hold
      </a>&nbsp;&nbsp;&nbsp;&loz;&nbsp;&nbsp;&nbsp;
      <a href="supporttickets.php?view=flagged">
          <span class="stat">{$ticketsflagged}</span>
          Flagged To Me
      </a>
      <input type="text" class="idinp cb-inidt" placeholder="Ticket ID ...">
      <span class="btn btn-warning btn-sm cb-idt">Open Ticket</span>
      <script>
        $(".cb-idt").click(function(){
            var inputid = $( ".cb-inidt" ).val();
            window.location.href = "https://codebox.ir/support/in6/supporttickets.php?ticketid="+inputid;
        });
      </script>
    </div>
  </div>
  
  <div class="cb6-leftside">
    <div id="sidebar"{if $minsidebar} style="display:none;"{/if}>
        {include file="$template/menu.tpl"}

        {include file="$template/sidebar.tpl"}
    </div>
    
  </div>
  <div class="cb6-page">
      <div class="container-fluid">
        <div class="alert alert-warning global-admin-warning{if !$globalAdminWarningMsg} hidden{/if}">
          {$globalAdminWarningMsg}
        </div>
        
        
    <div class="contentarea" id="contentarea"{if !$minsidebar} style="margin-left:209px;"{/if}>

        <div style="float:left;width:100%;">

            {if $helplink}
                <div class="contexthelp">
                    <a href="http://docs.whmcs.com/{$helplink}" target="_blank">
                        <img src="images/icons/help.png" border="0" align="absmiddle" />
                        {$_ADMINLANG.help.contextlink}
                    </a>
                </div>
            {/if}

            <h1{if $pagetitle == $_ADMINLANG.global.hometitle} class="pull-left"{/if}>{$pagetitle}</h1>
            

  
    
  
  

    



