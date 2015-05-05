 
function pubcom(){
			     
           
                if(!$.pinphp.dialog.islogin()) {alert("	请登录后评论！");};
                var id = $('#J_comment_area').attr('data-id'),
                    dv = $('#J_cmt_content').attr('def-val'),
                    content = $('#J_cmt_content').val();
                if(content == dv){
                    $('#J_cmt_content').focus();
                    return false;
                }
                $.ajax({
                    url: PINER.root + '/?m=item&a=comment',
                    type: 'POST',
                    data: {
                        id: id,
                        content: content
                    },
                    dataType: 'json',
                    success: function(result){
                        if(result.status == 1){
                            $('#J_cmt_content').val('');
                            $('#J_cmt_list').prepend(result.data);
                        }else{
                            $.pinphp.tip({content:result.msg, icon:'error'});
                        }
                    }
                });
         

}