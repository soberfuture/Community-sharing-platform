(function ($) {
    $.fn.x = function (xs) {
        var $this = $(this);
        //移动
        if (xs.move) {
            var $that = $(this);
            var $move = $("<div class='x-move-header'></div>").appendTo($that);
			$move.html('按住移动');
            $move.css({
                'position': 'absolute',
                'top': '0',
                'left': '0',
                'width': '100%',
                'height': '10%',
                'cursor': 'move',
				'background': '#f2f2f2',
				'select': 'none',
				'text-align': 'center',
				'line-height': '100%;'
            });
            $move.on('mousedown', function (event) {
                if ($that.css('position') != 'fixed'){
                    $that.css('position', 'fixed');
					}
                var e = event || window.event,
                    sx = e.offsetX,
                    sy = e.offsetY;
                $(document).on('mousemove', function (event) {
                    var e = event || window.event;
                    $that.css({
                        left: e.clientX - sx,
                        top: e.clientY - sy
                    });
                });
                $(document).on('mouseup', function () {
                    $(this).off('mousemove mouseup');
                });
            });
        }
        if (xs.close) {
            var $that = $(this);
            if ($that.css('position') == 'static') {
                $that.css('position', 'relative')
            }
            var $close = $("<a class='x-close' href='javascript:;'>&times;</a>").appendTo($that);
            $close.css({
                'position': 'absolute',
                'top': '0',
                'right': '0',
                'font-size': '40px',
                'font-weight': '700',
                'line-height': '1',
                'color': '#000',
                'text-shadow': '0 1px 0 #fff',
                'filter': 'alpha(opacity=50)',
                'opacity': '.5',
                'text-decoration': 'none',
                'cursor': 'pointer'
            });
            $close.on({
                'click': function () {
                    $that.parent().fadeOut('slow');
                },
                'mouseover': function () {
                    $close.css({
                        'filter': 'alpha(opacity=80)',
                        'opacity': '.8'
                    });
                },
                'mouseout': function () {
                    $close.css({
                        'filter': 'alpha(opacity=50)',
                        'opacity': '.5'
                    });
                }
            });
        }
        if (xs.resize) {
            var $that = $(this);
            if ($that.css('position') == 'static') {
                $that.css('position', 'relative')
            }
            $that.append("<div class='x-resize x-resizeT'></div><div class='x-resize x-resizeL'></div><div class='x-resize x-resizeB'></div><div class='x-resize x-resizeR'></div><div class='x-resize x-resizeTL'></div><div class='x-resize x-resizeBL'></div><div class='x-resize x-resizeBR'></div><div class='x-resize x-resizeTR'></div>");
            //上下拖动的大小
			$('.x-resizeT,.x-resizeB').css({
                'position': 'absolute',
                'width': '100%',
                'height': '10px',
                'cursor': 'n-resize'
            });
			//顶部拖动的位置
            $('.x-resizeT').css('top', '-10px');
			//底部拖动的位置
            $('.x-resizeB').css('bottom', '-10px');
            $('.x-resizeL,.x-resizeR').css({
                'position': 'absolute',
                'top': '0',
                'width': '10px',
                'height': '100%',
                'cursor': 'w-resize'
            });
            $('.x-resizeL').css('left', '-5px');
            $('.x-resizeR').css('right', '-5px');
            $('.x-resizeTL,.x-resizeBR').css({
                'position': 'absolute',
                'width': '10px',
                'height': '5px',
                'cursor': 'nw-resize'
            });
            $('.x-resizeTL').css({
                'top': '0px',
                'left': '0px'
            });
            $('.x-resizeBR').css({
                'bottom': '0px',
                'right': '0px'
            });
            $('.x-resizeTR,.x-resizeBL').css({
                'position': 'absolute',
                'width': '10px',
                'height': '10px',
                'cursor': 'ne-resize'
            });
            $('.x-resizeTR').css({
                'top': '0px',
                'right': '0px'
            });
            $('.x-resizeBL').css({
                'bottom': '0px',
                'left': '0px'
            });


            $('.x-resize').on('mousedown', function (event) {
                var e = event || window.event,
                    $this = $(this),
                    $h = $that.height(),
                    $w = $that.width(),
                    $t = parseFloat($that.css('top')),
                    $l = parseFloat($that.css('left')),
                    $ox = e.clientX,
                    $oy = e.clientY;
                $(document).on('mousemove', function (event) {
                    var e = event || window.event;
                    if ($this.hasClass('resizeB')) {
                        $that.css({
                            'height': $h + e.clientY - $oy + 'px'
                        });
                    }
                    if ($this.hasClass('x-resizeT')) {
                        $that.css({
                            'top': -(-$t + $oy - e.clientY) + 'px',
                            'height': $h + $oy - e.clientY + 'px'
                        });
                    }

                    if ($this.hasClass('x-resizeR')) {
                        $that.css({
                            'width': $w + e.clientX - $ox + 'px'
                        });
                    }

                    if ($this.hasClass('x-resizeL')) {
                        $that.css({
                            'left': -(-$l + $ox - e.clientX) + 'px',
                            'width': $w + $ox - e.clientX + 'px'
                        });
                    }

                    if ($this.hasClass('x-resizeTL')) {
                        $that.css({
                            'top': -(-$t + $oy - e.clientY) + 'px',
                            'height': $h + $oy - e.clientY + 'px',
                            'left': -(-$l + $ox - e.clientX) + 'px',
                            'width': $w + $ox - e.clientX + 'px'
                        });
                    }

                    if ($this.hasClass('resizeTR')) {
                        $that.css({
                            'width': $w + e.clientX - $ox + 'px',
                            'top': -(-$t + $oy - e.clientY) + 'px',
                            'height': $h + $oy - e.clientY + 'px'
                        });
                    }

                    if ($this.hasClass('x-resizeBR')) {
                        $that.css({
                            'height': $h + e.clientY - $oy + 'px',
                            'width': $w + e.clientX - $ox + 'px'
                        });
                    }

                    if ($this.hasClass('x-resizeBL')) {
                        $that.css({
                            'height': $h + e.clientY - $oy + 'px',
                            'left': -(-$l + $ox - e.clientX) + 'px',
                            'width': $w + $ox - e.clientX + 'px'
                        });
                    }

                });
                $(document).on('mouseup', function () {
                    $(this).off('mousemove mouseup');
                });
            });
        }
    }
})(jQuery);
