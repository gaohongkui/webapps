# 新闻发布系统V3.0 By杀手不太冷
>本项目已添加至个人GitHub仓库，永久更新地址 [新闻发布系统V3.0 By杀手不太冷](https://github.com/gaohongkui/webapps)

## Usage
- 记录每次提交修改的内容，便于回退版本，提交作业。
- 欢迎大家前来Fork，共同交流学习。

## Reminding
- 更新内容的说明在`Demo/新添内容说明.md`中

## This week's update
1. 不创建`newstype`类来获取类型列表，而是直接将查询的结果封装在列表里返回，类型为`List<Map<String,String>>`
例如数据为`[{"id":"1","newsType","校内"},{"id":"2","newsType","社会"}]`
2. 以后返回多个数据的都以数据列表返回，因此封装一个数据库操作`public List<Map<String, String>> getMultiRecord(String sql){}`
3. 已在部分地方使用`EL表达式`和`JSTL`语法
4. 修改操作成功或失败（添加、修改、删除新闻）时的提示页面，取消了页面+超链接跳转的方式。改用弹出对话框提示，并当用户点击确定后自动跳转到合适的页面。