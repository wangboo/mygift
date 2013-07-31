1./account/regist	注册
(1).注册游客身份
 入参
 is_guest = true
 phone = int
 如果手机号码被使用，则直接返回成功  registed = true
 反之，将数据生成到数据库，返回成功
(2).注册账号
is_guest = false
phone = int
user = string
pwd = string
is_push = boolean
email = string 非必输
icon = string 非必输
birthday = long 非必输
如果账号重复，则返回：该账号已被使用

2./account/login	登录
作用：重新绑定账号 与 手机号
入参
user
pwd
phone


新闻类型：
0 纯文本新闻
1 文本带图片新闻
2 图片集新闻
3 广告