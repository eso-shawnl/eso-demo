<?php echo $header; ?>
<div class="container">
        <!--
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
        -->
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="col-sm-9">
            <?php echo $content_top; ?>
            <div class="row">
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>
                    <!-- Banner -->
                    <!--
                <div class="col-sm-12">
                    <?php $i=0;  if ($thumb || $images) { $i++ ?>
                    <ul class="thumbnails">
                        <?php if ($thumb) { ?>
                        <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </div>
                    -->
                <div class="col-sm-12 text-center">
                    <?php echo $meta_title; ?>
                </div>
                    <!-- End Banner -->

                    <!-- Mobile images -->
 <!--               <div class="visible-xs" id="mobile-slider">
                    <?php
                        $i = 1;
                        foreach ($images as $img) {
                            $proThumb = explode('/', $img['thumb']);
                            if (substr(end($proThumb), 0, 2) === 'm-') {
                    ?>
                    <img src="<?php echo $img['thumb'] ?>" class="mobile-img col-md-12 img-responsive" id="mobile-img-<?php echo $i ?>">
                    <?php
                            $i++;
                            }
                        }
                    ?>
                </div>
                    <!-- End mobile images -->

                    <!-- Desktop images -->
                <div class="event-show-placeholder col-sm-12">
                    <img src="<?php echo $images[0]['popup'] ?>" class="slide-img">
                </div>
                <div class="event-show cycle-slideshow col-sm-12" data-cycle-speed="500" data-cycle-fx="scrollHorz" id="victorw-slide">
                    <?php
                        foreach ($images as $img) {
                            $proPop = explode('/', $img['popup']);
                            if (substr(end($proPop), 0, 2) !== 'm-') {
                    ?>
                            <img src="<?php echo $img['popup'] ?>" class="slide-img">
                    <?php
                            }
                        }
                    ?>
                </div>
                    <!-- End desktop images -->

                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>

            </div>

            <div class="row thin-bar">

                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>

                <div class="col-sm-6 pull-left">
                    <span style="font-weight: 100"><?php echo 'Viewed: '.$view_number ?></span>
                </div>

                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>

                <div class="col-sm-6 pull-right">

                    <div class="rating">
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style">
                            <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                            <a class="addthis_button_tweet"></a>
                                <!--
                            <a class="addthis_button_pinterest_pinit"></a>
                            <a class="addthis_counter addthis_pill_style"></a>
                                -->
                        </div>
                        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                        <!-- AddThis Button END -->

                    </div>
                </div>

            </div>

            <div class="row">
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-12'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-12'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-15'; ?>
                <?php } ?>

                <div class="<?php echo $class; ?>">
                    <div class="tab-content">
                            <!--
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                            <?php if ($attribute_groups) { ?>
                            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                            <?php } ?>
                        </ul>
                            -->
                        <div class="tab-pane active" id="tab-description"><?php echo $description; ?>
                        </div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <thead>
                                <tr>
                                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                    <td><?php echo $attribute['name']; ?></td>
                                    <td><?php echo $attribute['text']; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                                <?php } ?>
                            </table>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <?php if ($products) { ?>
            <h3><?php echo $text_related; ?></h3>
            <div class="row">
                <?php $i = 0; ?>
                <?php foreach ($products as $product) { ?>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
                <?php } else { ?>
                <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="product-thumb transition">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="caption">
                            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                            <p><?php echo $product['description']; ?></p>

                        </div>
                        <div class="button-group">
                            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                        </div>
                    </div>
                </div>
                <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
                <div class="clearfix visible-md visible-sm"></div>
                <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
                <div class="clearfix visible-md"></div>
                <?php } elseif ($i % 4 == 0) { ?>
                <div class="clearfix visible-md"></div>
                <?php } ?>
                <?php $i++; ?>
                <?php } ?>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <aside class="col-sm-3" id="column-right">
            </br>
            <?php echo $meta_description; ?>
        </aside>

        <?php echo $column_right; ?>


    </div>
</div>

<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart-total').html(json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
                $('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
                $('input[name=\'captcha\']').val('');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });

    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    });

    //--></script>
        <!-- Shawn Added -->
        <script src="./bower_components/jquery-cycle2/build/jquery.cycle2.min.js"></script>
        <script src="./js/event.js"></script>
        <!-- End Shawn Added -->
<?php echo $footer; ?>
