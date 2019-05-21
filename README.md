# 新闻发布系统V3.0 By杀手不太冷
>本项目已添加至个人GitHub仓库，永久更新地址 [新闻发布系统V3.0 By杀手不太冷](https://github.com/gaohongkui/webapps)

## Usage
- 记录每次提交修改的内容，便于回退版本，提交作业。
- 欢迎大家前来Fork，共同交流学习。

## Reminding
- 更新内容的说明在`Demo/新添内容说明.md`中

## This week's update
1. 完成上机内容
2. 为`News`新添属性`type`，用于存放真实的新闻类型（例如校园、国内，为了在首页显示出来）
3. 部分`Servlet`使用`@WebServlet()`注解，与配置`web.xml`都做尝试
4. 在查询中增加关键字回显功能，即显示关键字并把用户原输入的关键字标红
5. 标题过长省略显示机制，当标题过长时，超出部分用省略号`···`代替，主要用 `white-space: nowrap;text-overflow: ellipsis;`实现