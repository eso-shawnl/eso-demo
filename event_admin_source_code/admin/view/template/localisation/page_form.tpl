<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-page_detail" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
    <!--
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      -->
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-page_detail" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute_list; ?></a></li>
            <li><a href="#tab-data1" data-toggle="tab"><?php echo $tab_attribute_add; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data_load; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active in" id="tab-general">
              <div class="col-sm-4">      
                <label class="control-label" for="input-name"><?php echo $entry_id; ?></label>
                <input type="text" readonly = true name="page_id" value="<?php echo $page_id; ?>" placeholder="<?php echo $page_id; ?>" id="input-id" class="form-control" />    
          	       
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
             
                <td class="text-left"><select name="page_name" class="form-control">
                  <?php if (empty($page_name)) {?>
	                  <?php foreach ($select_pages as $select_page) { ?>
	                 	 <?php if (isset($select_page) && ($page_name == $select_page)) { ?>
	                 		 <option value="<?php echo $select_page; ?>" selected="selected"><?php echo $select_page; ?></option>
	                 	 <?php } else { ?>
	                  		 <option value="<?php echo $select_page; ?>"><?php echo $select_page; ?></option>
	                 	 <?php } ?>
	                  <?php } ?>
                  <?php } else { ?>
                 	 <option value="<?php echo $page_name; ?>" selected="selected"><?php echo $page_name; ?></option>
                  <?php } ?>
                </select></td>   
          	  </div>
          	  <div class="col-sm-4"> 
          	  <ul> 
          	  <?php foreach ($result as $k=>$val) { ?>
          	  	<?php if (!empty($val)) {?>
	          	  	<?php foreach ($val as $v) { ?>
			            <li><?php print_r( $k.':'.$v['key'].' -- '.$v['value'].' -- '.$v['result'].' -- '.$v['reason']); ?></li>
			        <?php }?>
			    <?php }?>
          	  <?php }?>
          	  </ul> 
          	  </div> 
            </div>
            <div class="tab-pane" id="tab-attribute">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  	<div class="table-responsive">
			            <table class="table table-bordered table-hover">
			              <thead>
			                <tr>
			                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
			                  <td class="text-center" style="width:15%"><?php echo $column_name; ?></td>
			                  <td class="text-center" style="width:50%"><?php echo $column_value; ?></td>
			                  <td class="text-right" style="width:30%"><?php echo $button_edit; ?></td>
			                </tr>
			              </thead>
			              <tbody>
			                <?php if ($page_captions) { ?>
			                <?php foreach ($page_captions[$language['language_id']] as $page_caption) { ?>
			                <tr> 
			                  <td class="text-center" name="<?php echo $page_caption['id']; ?>" ><?php if (in_array($page_caption['id'], $selected)) { ?>
			                    <input type="checkbox" name="selected[]" value="<?php echo $page_caption['id']; ?>" checked="checked" />
			                    <?php } else { ?>
			                    <input type="checkbox" name="selected[]" value="<?php echo $page_caption['id']; ?>" />
			                    <?php } ?></td>
			                  <td class="text-left" id="caption_name" value="<?php echo $page_caption['name']; ?>" name="<?php echo $page_caption['name']; ?>">
			                  	<?php echo $page_caption['name']; ?>
			                  </td>
			                  <td class="text-left" >
			                	<input type="text" name="caption[<?php echo $page_caption['id']; ?>][value]" readonly=true value="<?php echo $page_caption['value']; ?>" placeholder="" id="<?php echo $page_caption['id']; ?>" class="form-control" />
			                  	<input type="hidden" name="caption[<?php echo $page_caption['id']; ?>][status]" value="0" id="status<?php echo $page_caption['id']; ?>" />
			                  	<input type="hidden" name="" value="<?php echo $page_caption['value']; ?>" id="revert<?php echo $page_caption['id']; ?>" />
			                  </td>
			                  <td class="text-right">
			                  	<button type="button" id="button_edit<?php echo $page_caption['id']; ?>" onclick="editDescription(<?php echo $page_caption['id']; ?>);" class="btn btn-primary pull-left"><i class="fa fa-search"></i> <?php echo $button_edit; ?></button>
			                  	<button type="button" id="button_delete<?php echo $page_caption['id']; ?>" onclick="deleteDescription(<?php echo $page_caption['id']; ?>);" class="btn btn-primary pull-left"><i class="fa fa-search"></i><?php echo $button_delete; ?> </button>
			                  	<button type="button" id="button_revert<?php echo $page_caption['id']; ?>" onclick="revertDescription(<?php echo $page_caption['id']; ?>);" class="btn btn-primary pull-right"><i class="fa fa-search"></i><?php echo $button_revert; ?> </button>
			                  </td>
			                </tr>
			                <?php } ?>
			                <?php } else { ?>
			                <tr>
			                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
			                </tr>
			                <?php } ?>
			              </tbody>
			            </table>
			         </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data1">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_attribute; ?></td>
                      <td class="text-left"><?php echo $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $attribute_row = 0; ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="panel-body">
		        <form class="form-horizontal">
		          <div class="form-group required">
		            <label class="col-sm-2 control-label" for="button-upload"><span data-toggle="tooltip" title="<?php echo $help_upload; ?>"><?php echo $entry_upload; ?></span></label>
		            <div class="col-sm-10">
		              <button type="button" id="button-upload" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
		              <?php if ($error_warning) { ?>
		              <button type="button" id="button-clear" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></button>
		              <?php } else { ?>
		              <button type="button" id="button-clear" data-loading-text="<?php echo $text_loading; ?>" disabled="disabled" class="btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></button>
		              <?php } ?>
		            </div>
		          </div>
		        </form>
		      </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var step = new Array();
var total = 0;

$('#button-upload').on('click', function() {
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);	
			
			// Reset everything
			$('.alert').remove();
			$('#progress-bar').css('width', '0%');
			$('#progress-bar').removeClass('progress-bar-danger progress-bar-success');		
			$('#progress-text').html('');
		
			$.ajax({
				url: 'index.php?route=localisation/page/upload&token=<?php echo $token; ?>',
				type: 'post',		
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,		
				beforeSend: function() {
					$('#button-upload').button('loading');
				},
				complete: function() {
					$('#button-upload').button('reset');
				},
				success: function(json) {
					if (json['error']) {
						$('#progress-bar').addClass('progress-bar-danger');				
						$('#progress-text').html('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['step']) {
						step = json['step'];
						total = step.length;
						
						if (json['overwrite'].length) {
							html = '';
							
							for (i = 0; i < json['overwrite'].length; i++) {
								html += json['overwrite'][i] + "\n";
							}
							
							$('#overwrite').html(html);
							
							$('#button-continue').prop('disabled', false);
						} else {
							next();
						}	
					}
				},			
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});	
		}
	}, 500);
});


$('#button-clear').bind('click', function() {
	$.ajax({
		url: 'index.php?route=extension/installer/clear&token=<?php echo $token; ?>',	
		dataType: 'json',
		beforeSend: function() {
			$('#button-clear').button('loading');
		},	
		complete: function() {
			$('#button-clear').button('reset');
		},		
		success: function(json) {
			$('.alert').remove();
				
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			} 
		
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#button-clear').prop('disabled', true);
			}
		},			
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script></div> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%;"><input type="text" name="page_attribute[' + attribute_row + '][name]"  id="input-name"  value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="page_attribute[' + attribute_row + '][page_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';
	
	$('#attribute tbody').append(html);
	attributeautocomplete(attribute_row);

	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'page_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=localisation/page/autocomplete_caption&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['caption_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'page_attribute[' + attribute_row + '][name]\']').val(item['label']); 
			var languages = <?php echo json_encode($languages) ?>;
			var page_captions = <?php echo json_encode($page_captions) ?>;
			$.each(languages, function(keys, language) {
				var lang=language['language_id'];
				$.each(page_captions[language["language_id"]], function(key, value) {
					if(item['value']==value["caption_id"]){
						$('textarea[name=\'page_attribute[' + attribute_row + '][page_attribute_description]['+lang+'][text]\']').val(value['value']); 
					}
				});	     
			});
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});

//--></script>
<script type="text/javascript"><!--
function editDescription(objID) {
	$('#'+objID).attr("readonly",false);
	
	$('#status'+objID).attr("value","update");
	
	$('#button_edit'+objID).attr("disabled",true);
	$('#button_delete'+objID).attr("disabled",true);
	$('#button_revert'+objID).attr("disabled",false);
}

function deleteDescription(objID) {
	$('#status'+objID).attr("value","delete");
	
	$('#button_delete'+objID).attr("disabled",true);
	$('#button_edit'+objID).attr("disabled",true);
	$('#button_revert'+objID).attr("disabled",false);
}

function revertDescription(objID) {
	$('#'+objID).val($('#revert'+objID).attr("value"));
	$('#'+objID).attr("readonly",true);
	
	$('#status'+objID).attr("value","");
	
	
	$('#button_edit'+objID).attr("disabled",false);
	$('#button_delete'+objID).attr("disabled",false);
	$('#button_revert'+objID).attr("disabled",true);

}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>

<script type="text/javascript"><!--

    $('input.form-control').autocomplete({
        'source': function(request, response) {
            var index_id =$(this).attr("id");

            $.ajax({
                url: 'index.php?route=localisation/page/autocomplete_description&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request) +'&index_id='+index_id,
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['value'],
                            value: item['description_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $(this).val(item['label']);
        }
    });

    //--></script></div>

<?php echo $footer; ?>
