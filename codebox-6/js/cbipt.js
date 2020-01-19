$(document).ready(function(){

  //$("input[name*=\'dedicatedip\']").prop("disabled", true);
  //$("textarea[name*=\'assignedips\']").prop("disabled", true);
  //$("input[name*=\'dedicatedip\']").closest("tr").hide();
  //$("textarea[name*=\'assignedips\']").closest("tr").hide();
  
  $("input[name*=\'ns1\']").closest("tr").hide();
  $("input[name*=\'ns2\']").closest("tr").hide();

  $.get( "https://dev.codebox.ir/ajax.php?c=server&a=getServiceIPs&id="+ServicID, function( data ) {
    if(data!=0) {
      var obj = JSON.parse(data);
      obj.forEach(doRow);
      
      function doRow(item, index) {
        let rowt = "<tr>";
        rowt += "<td>"+item.id+"</td>";
        rowt += "<td>"+item.cflag+"</td>";
        rowt += "<td>"+item.ip+"</td>";
        rowt += "<td>"+item.mac+"</td>";
        rowt += "<td>"+item.gateway+"</td>";
        rowt += "<td>"+item.netmask+"</td>";
        rowt += "<td>"+item.dns1+" - "+item.dns2+"</td>";
        rowt += "<td>"+item.network+"</td>";
        
        if (item.status == 0) { rowt += "<td class='bg-success'>Free</td>"; }
        else if (item.status == 1) { rowt += "<td class='bg-primary'>Main</td>"; }
        else if (item.status == 2) { rowt += "<td class='bg-danger'>Pended</td>"; }
        else if (item.status == 3) { rowt += "<td class='bg-info'>Extra</td>"; }
        else if (item.status == 4) { rowt += "<td class='bg-warning'>CB</td>"; }
        else if (item.status == 7) { rowt += "<td class='bg-warning'>Old</td>"; }                  
        
        rowt += "<td class='text-right'><button type='button' class='btn btn-xs btn-danger do-freeIP' data-id='"+item.id+"'> x </button></td>";
        rowt += "</tr>";
        $("#iptiplist").append(rowt);
      }
    }
  });
  
  $(document).on("click", '.do-freeIP', function(event) { 
    var ipid = $(this).data('id');
    var delconfirm = confirm('Are you sure to Delete the IP?');
    if (delconfirm) {
      $.ajax({
        type: "POST",
        url: "https://dev.codebox.ir/ajax.php?c=server&a=FreeIP&id="+ipid,
        data: false,
        cache: false,
        success: function(data) {
          if(data!=0) {
            location.reload();
          } else {
            alert('Error !');
          }
        }
      });
    }
  }); 
  
  
  $(document).on("click", '#FreeServerIP', function(event) { 
    var delconfirm = confirm('Are you sure to Delete All IPs?');
    if (delconfirm) {
      $.ajax({
        type: "POST",
        url: "https://dev.codebox.ir/ajax.php?c=server&a=FreeServerIP&id="+ServicID,
        data: false,
        cache: false,
        success: function(data) {
          if(data!=0) {
            location.reload();
          } else {
            alert('Error !');
          }
        }
      });
    }
  }); 
  
  
});
  
  