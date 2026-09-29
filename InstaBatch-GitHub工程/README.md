# InstaBatch

批量接收 Instagram 公开帖子和 Reels 链接的 iOS 工程骨架。项目通过 GitHub Actions 的 macOS runner 生成未签名 IPA，下载后可用爱思助手签名安装。

## 构建

在 GitHub Actions 中手动运行 **Build unsigned IPA**，完成后下载 `InstaBatch-unsigned-ipa` artifact。

当前版本已包含批量链接输入和下载队列界面。Instagram 页面解析需要接入稳定的解析服务；原快捷指令使用的第三方接口没有稳定公开 API，不能把它当成长期后端。
