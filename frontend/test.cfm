$.ajax({
  type: 'post',
  url: 'test2.php',
  dataType: 'json',
  data: {
    txt: txtbox,
    hidden: hiddenTxt
  },
  cache: false,
  success: function(returndata) {
    if (returndata[4] === 1) {

      $("#bsModal3").modal('show');

    } else {
      // other code
    }
  },
  error: function() {
    console.error('Failed to process ajax !');
  }
});
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>




<!-- Modal -->
<div class="modal fade" id="bsModal3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="mySmallModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        Your content goes here...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>