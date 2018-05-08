/**
 * Created by carl on 8/1/17.
 */

jQuery.fn.repeat = jQuery.fn.repeat || function(data, callback, target) {

        var _this = this;
        var curData = [];
        var templete = [];

        if (data === undefined) data = [];
        if (typeof data == "object" && ! $.isArray(data)) data = [data];

        var repeat = function() {
            _this.each(function(index) {
                var _self = this;

                if ( ! templete[index]) {
                    templete[index] = $(_self).clone();
                    $(_self).hide();
                }

                if ( ! curData[index]) {
                    curData[index] = [];
                }

                for (var i = 0; i < curData[index].length; i++) {
                    if (data.indexOf(curData[index][i].data) == -1) {
                        $(curData[index][i].node).remove();
                        curData[index].splice(i, 1);
                        i--;
                    }
                }

                var nextNodeIndex = curData[index].length - 1;

                for (var i = data.length - 1; i >= 0; i--) {
                    if (nextNodeIndex != -1 && curData[index][nextNodeIndex].data === data[i]) {
                        nextNodeIndex--;
                        continue;
                    }

                    var dom = templete[index].clone();
                    var refNode = nextNodeIndex == -1 ? _self : curData[index][nextNodeIndex].node;

                    callback(dom, i, data[i]);

                    $(dom).insertAfter($(refNode));

                    curData[index].splice(nextNodeIndex + 1, 0, {
                        data: data[i],
                        node: dom
                    });
                }
            });
        };

        repeat();

        return {
            refresh: function(deep) {
                // TODO: implement deep
                repeat();
            }
        }
    };
