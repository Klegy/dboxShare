$include('/storage/data/department-data-json.js');
$include('/storage/data/user-data-json.js');


// 页面初始化事件调用函数
function init() {
    pageResize();
    userTree();
}


// 页面调整
function pageResize() {
    var container = $id('container');
    var footer = $id('footer');

    container.style.height = (container.offsetHeight - footer.offsetHeight) + 'px';
}


// 生成用户树形目录(主体)
function userTree() {
    var container = $id('container');
    var user = $query('user');
    var items = '';
    var node;
    var i;

    if (typeof(jsonDataDepartment) == 'undefined') {
        for (i = 0; i < jsonDataUser.length; i++) {
            if (jsonDataUser[i].dbs_id == window.top.myId) {
                continue;
            }

            items += '<li>';
            items += '<div class=\"item\" onClick=\"checkboxSelect(' + jsonDataUser[i].dbs_id + ', event);\">';
            items += '<div class=\"blank\"></div>';
            items += '<div class=\"state none\"></div>';
            items += '<div class=\"box\"><input name=\"id\" type=\"checkbox\" class=\"checkbox\" value=\"' + jsonDataUser[i].dbs_id + '\" /></div>';
            items += '<div class=\"icon\"><img src=\"/ui/images/select-user-icon.png\" width=\"16\" /></div>';
            items += '<div class=\"name\">' + jsonDataUser[i].dbs_username + '&nbsp;&nbsp;<font color=\"#757575\">' + jsonDataUser[i].dbs_position + '</font></div>';
            items += '</div>';
            items += '<div class=\"node\"></div>';
            items += '</li>';
        }
    } else {
        for (i = 0; i < jsonDataDepartment.length; i++) {
              if (jsonDataDepartment[i].dbs_departmentid == 0) {
                node = userTreeNode(jsonDataDepartment[i].dbs_id, 1);

                items += '<li>';
                items += '<div class=\"item\" onClick=\"itemSelect(' + jsonDataDepartment[i].dbs_id + ', event);\">';
                items += '<div class=\"state\">';

                if (node.length > 0) {
                    items += '<img src=\"/ui/images/select-node-close-icon.png\" width=\"16\" />';
                }

                items += '</div>';
                items += '<div class=\"box none\"><input name=\"id\" type=\"checkbox\" class=\"none\" value=\"' + jsonDataDepartment[i].dbs_id + '\" /></div>';
                items += '<div class=\"icon\"><img src=\"/ui/images/select-department-icon.png\" width=\"16\" /></div>';
                items += '<div class=\"name\">' + jsonDataDepartment[i].dbs_name + '<input name=\"name\" type=\"hidden\" value=\"' + jsonDataDepartment[i].dbs_name + '\" /></div>';
                items += '</div>';
                items += '<div class=\"node\">' + node + '</div>';
                items += '</li>';
            }
        }
    }

    container.innerHTML = '<ul>' + items + '</ul>';

    itemSelected(user);
}


// 生成用户树形目录(节点)
function userTreeNode(departmentId, level) {
    var items = '';
    var node;
    var i;

    for (i = 0; i < jsonDataDepartment.length; i++) {
          if (jsonDataDepartment[i].dbs_departmentid == departmentId) {
            node = userTreeNode(jsonDataDepartment[i].dbs_id, level + 1);

            items += '<li>';
            items += '<div class=\"item\" onClick=\"itemSelect(' + jsonDataDepartment[i].dbs_id + ', event);\">';
            items += '<div class=\"blank\" style=\"width: ' + (24 * level) + 'px;\"></div>';
            items += '<div class=\"state\">';

            if (node.length > 0) {
                items += '<img src=\"/ui/images/select-node-close-icon.png\" width=\"16\" />';
            }

            items += '</div>';
            items += '<div class=\"box none\"><input name=\"id\" type=\"checkbox\" class=\"none\" value=\"' + jsonDataDepartment[i].dbs_id + '\" /></div>';
            items += '<div class=\"icon\"><img src=\"/ui/images/select-department-icon.png\" width=\"16\" /></div>';
            items += '<div class=\"name\">' + jsonDataDepartment[i].dbs_name + '<input name=\"name\" type=\"hidden\" value=\"' + jsonDataDepartment[i].dbs_name + '\" /></div>';
            items += '</div>';
            items += '<div class=\"node\">' + node + '</div>';
            items += '</li>';
        }
    }

    for (i = 0; i < jsonDataUser.length; i++) {
        if (jsonDataUser[i].dbs_id == window.top.myId) {
            continue;
        }

        if (window.eval('/\\/' + departmentId + '\\/$/').test(jsonDataUser[i].dbs_departmentid) == true) {
            items += '<li>';
            items += '<div class=\"item\" onClick=\"checkboxSelect(' + jsonDataUser[i].dbs_id + ', event);\">';
            items += '<div class=\"blank\" style=\"width: ' + (24 * level) + 'px;\"></div>';
            items += '<div class=\"state none\"></div>';
            items += '<div class=\"box\"><input name=\"id\" type=\"checkbox\" class=\"checkbox\" value=\"' + jsonDataUser[i].dbs_id + '\" /></div>';
            items += '<div class=\"icon\"><img src=\"/ui/images/select-user-icon.png\" width=\"16\" /></div>';
            items += '<div class=\"name\">' + jsonDataUser[i].dbs_username + '&nbsp;&nbsp;<font color=\"#757575\">' + jsonDataUser[i].dbs_position + '</font></div>';
            items += '</div>';
            items += '<div class=\"node\"></div>';
            items += '</li>';
        }
    }

    if (items.length == 0) {
        return '';
    } else {
        return '<ul id=\"' + departmentId + '\">' + items + '</ul>';
    }
}


// 项目选择(手动选择)
function itemSelect(id, event) {
    var event = event || window.event;
    var tag = event.target || event.srcElement;
    var checkboxes = $name('id');
    var states = $class('state');
    var nodes = $class('node');
    var mark;
    var i;

    for (i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].$get('class') == 'none' && checkboxes[i].value == id) {
            if (tag.tagName.toLowerCase() != 'input') {
                if (typeof(states[i]) == 'undefined') {
                    continue;
                }

                mark = states[i].$tag('img')[0];

                if (typeof(mark) != 'undefined') {
                    if (mark.src.indexOf('select-node-open-icon') == -1) {
                        mark.src = '/ui/images/select-node-open-icon.png';

                        nodes[i].style.display = 'block';
                    } else {
                        mark.src = '/ui/images/select-node-close-icon.png';

                        nodes[i].style.display = 'none';
                    }
                }

                break;
            }
        }
    }
}


// 项目选择(自动选择上次已选中项目)
function itemSelected(user) {
    var users = new Array();
    var radios = $name('id');
    var items = $class('item');
    var i;
    var j;

    if (user.length == 0) {
        return;
    }

    users = user.split(',');

    for (i = 0; i < users.length; i++) {
        for (j = 0; j < radios.length; j++) {
            if (users[i] == radios[j].value) {
                items[j].click();
                break;
            }
        }
    }
}


// 复选框选择
function checkboxSelect(id, event) {
    var event = event || window.event;
    var tag = event.target || event.srcElement;
    var checkboxes = $name('id');
    var items = $class('item');
    var i;

    for (i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].$get('class') == 'checkbox' && checkboxes[i].value == id) {
            if (tag.tagName.toLowerCase() == 'input') {
                if (checkboxes[i].checked == true) {
                    items[i].style.backgroundColor = '#E0E0E0';
                } else {
                    items[i].style.backgroundColor = '';
                }
            } else {
                if (checkboxes[i].checked == false) {
                    checkboxes[i].checked = true;

                    items[i].style.backgroundColor = '#E0E0E0';
                } else {
                    checkboxes[i].checked = false;

                    items[i].style.backgroundColor = '';
                }
            }

            break;
        }
    }
}


// 提交用户选择
function userSelect() {
    var iframe = $query('iframe');
    var callback = $query('callback');
    var form = iframe.length == 0 ? 'window.parent' : 'window.parent.$id(\'' + iframe + '\').contentWindow';
    var checkboxes = $name('id');
    var data = '';
    var i;

    for (i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked == true) {
            data += checkboxes[i].value + ',';
        }
    }

    if (data.length == 0) {
        fastui.textTips(lang.task.tips['please-select-user']);
        return;
    } else {
        data = data.substring(0, data.length - 1);
    }

    window.eval('var _function = ' + form + '.' + callback);
    _function(data);

    window.parent.fastui.windowClose('task-user-select');
}