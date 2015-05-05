<?php 
header('Content-Type:text/html;charset=utf-8');
class backendAction extends baseAction
{
    protected $_name = '';
    protected $menuid = 0;
    public function _initialize()
    {
        parent::_initialize();
        $this->_name = $this->getActionName();
        $this->check_priv();
        $this->menuid = $this->_request('menuid', 'trim', 0);
        if ($this->menuid) {
            $sub_menu = D('menu')->sub_menu($this->menuid, $this->big_menu);
            $selected = '';
            foreach ($sub_menu as $key => $val) {
                $sub_menu[$key]['class'] = '';
                if ((MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name']) && strpos(__SELF__, $val['data'])) {
                    $sub_menu[$key]['class'] = ($selected = 'on');
                }
            }
            if (empty($selected)) {
                foreach ($sub_menu as $key => $val) {
                    if (MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name']) {
                        $sub_menu[$key]['class'] = 'on';
                        break;
                    }
                }
            }
            $this->assign('sub_menu', $sub_menu);
        }
        $PHP_SELF = $_SERVER['PHP_SELF'];
        $ym = $_SERVER['HTTP_HOST'] . substr($PHP_SELF, 0, (strrpos($PHP_SELF, '/') + 1));
       // $url = 'http://wx.breadth.com.cn/shouquan/index.php?url=' . $ym;
       // $code = $this->vita_get_url_content($url);
       // $code = json_decode($code, true);
       // if ($code['code'] == 'not') {
         //   redirect('http://wx.breadth.com.cn/', 3, '<meta http-equiv=\\"Content-Type\\" content=\\"text/html; charset=utf-8\\" /><h3 style="text-align:center">您的域名未授权！请授权后使用，联系我们！QQ:472343221</h3><p style="text-align:center">页面跳转中...</p>');
      //  } else {
            $this->assign('shouquan', $code['code']);
            $this->assign('newslist', $code['news']);
            $this->assign('menuid', $this->menuid);
      //  }
    }
    public function vita_get_url_content($url)
    {
        if (function_exists('file_get_contents')) {
            $file_contents = file_get_contents($url);
        } else {
            $ch = curl_init();
            $timeout = 5;
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
            $file_contents = curl_exec($ch);
            curl_close($ch);
        }
        return $file_contents;
    }
    public function index()
    {
        $map = $this->_search();
        $mod = D($this->_name);
        !empty($mod) && $this->_list($mod, $map);
        $this->display();
    }
    public function add()
    {
        $mod = D($this->_name);
        if (IS_POST) {
            if (false === ($data = $mod->create())) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            if (method_exists($this, '_before_insert')) {
                $data = $this->_before_insert($data);
            }
            if ($mod->add($data)) {
                if (method_exists($this, '_after_insert')) {
                    $id = $mod->getLastInsID();
                    $this->_after_insert($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'add');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $this->assign('open_validator', true);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {
                $this->display();
            }
        }
    }
    public function edit()
    {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        if (IS_POST) {
            if (false === ($data = $mod->create())) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            if (method_exists($this, '_before_update')) {
                $data = $this->_before_update($data);
            }
            if (false !== $mod->save($data)) {
                if (method_exists($this, '_after_update')) {
                    $id = $data['id'];
                    $this->_after_update($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'edit');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $id = $this->_get($pk, 'intval');
            $info = $mod->find($id);
            $this->assign('info', $info);
            $this->assign('open_validator', true);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {
                $this->display();
            }
        }
    }
    public function ajax_edit()
    {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $id = $this->_get($pk, 'intval');
        $field = $this->_get('field', 'trim');
        $val = $this->_get('val', 'trim');
        $mod->where(array($pk => $id))->setField($field, $val);
        $this->ajaxReturn(1);
    }
    public function delete()
    {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $ids = trim($this->_request($pk), ',');
        if ($ids) {
            if (false !== $mod->delete($ids)) {
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'));
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            IS_AJAX && $this->ajaxReturn(0, L('illegal_parameters'));
            $this->error(L('illegal_parameters'));
        }
    }
    protected function _search()
    {
        $mod = D($this->_name);
        $map = array();
        foreach ($mod->getDbFields() as $key => $val) {
            if (substr($key, 0, 1) == '_') {
                continue;
            }
            if ($this->_request($val)) {
                $map[$val] = $this->_request($val);
            }
        }
        return $map;
    }
    protected function _list($model, $map = array(), $sort_by = '', $order_by = '', $field_list = '*', $pagesize = 20)
    {
        $mod_pk = $model->getPk();
        if ($this->_request('sort', 'trim')) {
            $sort = $this->_request('sort', 'trim');
        } else {
            if (!empty($sort_by)) {
                $sort = $sort_by;
            } else {
                if ($this->sort) {
                    $sort = $this->sort;
                } else {
                    $sort = $mod_pk;
                }
            }
        }
        if ($this->_request('order', 'trim')) {
            $order = $this->_request('order', 'trim');
        } else {
            if (!empty($order_by)) {
                $order = $order_by;
            } else {
                if ($this->order) {
                    $order = $this->order;
                } else {
                    $order = 'DESC';
                }
            }
        }
        if ($pagesize) {
            $count = $model->where($map)->count($mod_pk);
            $pager = new Page($count, $pagesize);
        }
        $select = $model->field($field_list)->where($map)->order(($sort . ' ') . $order);
        $this->list_relation && $select->relation(true);
        if ($pagesize) {
            $select->limit(($pager->firstRow . ',') . $pager->listRows);
            $page = $pager->show();
            $this->assign('page', $page);
        }
        $list = $select->select();
        $this->assign('list', $list);
        $this->assign('list_table', true);
    }
    public function check_priv()
    {
        if (MODULE_NAME == 'attachment') {
            return true;
        }
        if ((!isset($_SESSION['admin']) || !$_SESSION['admin']) && !in_array(ACTION_NAME, array('login', 'verify_code'))) {
            $this->redirect('index/login');
        }
        if ($_SESSION['admin']['role_id'] == 1) {
            return true;
        }
        if (in_array(MODULE_NAME, explode(',', 'index'))) {
            return true;
        }
        $menu_mod = M('menu');
        $menu_id = $menu_mod->where(array('module_name' => MODULE_NAME, 'action_name' => ACTION_NAME))->getField('id');
        $priv_mod = D('admin_auth');
        $r = $priv_mod->where(array('menu_id' => $menu_id, 'role_id' => $_SESSION['pp_admin']['role_id']))->count();
        if (!$r) {
            $this->error(L('_VALID_ACCESS_'));
        }
    }
    protected function update_config($new_config, $config_file = '')
    {
        !is_file($config_file) && ($config_file = CONF_PATH . 'home/config.php');
        if (is_writable($config_file)) {
            $config = require $config_file;
            $config = array_merge($config, $new_config);
            file_put_contents($config_file, ('<?php 
return ' . stripslashes(var_export($config, true))) . ';', LOCK_EX);
            @unlink(RUNTIME_FILE);
            return true;
        } else {
            return false;
        }
    }
}?>