// 计算分页
let pagination = (totalSize, currentPage, pageSize=5)=> {
  let totalCount = Math.ceil(totalSize/12);
  // 每次显示5个分页按钮
  let startCount = Math.ceil(currentPage/pageSize);
  if(startCount > 1) {
    startCount = (startCount-1)*5+1;
  }
  console.log('startCount, totalCount',startCount, totalCount);
  return {
    startCount,
    totalCount
  }
}

module.exports = {
  pagination: pagination
}