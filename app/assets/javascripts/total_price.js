$(document).ready(function() {
  $('#start_date').change(function() {
    var start_date = $('#start_date').val();
    if ($('#start_date').val() != "" && $('#end_date').val() != "") {
      var start_date = process($('#start_date').val());
      var end_date = process($('#end_date').val());
      var kitten_price = $('#kitten-price').text();
      var number_of_days = (end_date - start_date)/(1000*60*60*24);
      var total_price = (number_of_days + 1) * kitten_price;
      $('.total-price-amount').html(total_price);
    }
    });
  $('#end_date').change(function() {
    var start_date = $('#start_date').val();
    if ($('#start_date').val() != "" && $('#end_date').val() != "") {
      var start_date = process($('#start_date').val());
      var end_date = process($('#end_date').val());
      var kitten_price = $('#kitten-price').text();
      var number_of_days = (end_date - start_date)/(1000*60*60*24);
      var total_price = (number_of_days + 1) * kitten_price;
      $('.total-price-amount').html(total_price);
    }
    });
});

function process(date){
   var parts = date.split("/");
   return new Date(parts[2], parts[1] - 1, parts[0]);
}
