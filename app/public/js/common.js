$(function() {
  // 禁止按钮不允许提交
  $('.disabled').click((e)=>{
    return false
  })

  // 电影详情页评论回复
  $(".comment").click(function(a) {
    var target=$(this)
    var toId=target.data('tid')
    var commentId=target.data('cid')
    $('#toId').val(toId)
    $('#commentId').val(commentId)
  })
  $('#submit').click(function(e){
    e.preventDefault()
    $.ajax({
      type:'POST',
      data:$('#commentForm').serialize(),
      url:'/comment/add'
    })
    .done(function(results){
      if(results.success===1){
        window.location.reload()
      }
    })
  })

  // 注册、登录弹窗
  // $('#signin').click(function(){
  //   $('#signinModal').modal()
  // })
  // $('#signup').click(function(){
  //   $('#signupModal').modal()
  // })
})