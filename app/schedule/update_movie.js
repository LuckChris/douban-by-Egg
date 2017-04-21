// 定时从豆瓣获取电影数据，缓存到本地数据库中
module.exports = {
  schedule: {
    interval: '5m',
    type: 'all'
  },

  * task(ctx) {
    
  }
}