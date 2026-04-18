# lovstudio-shell-tools

个人 zsh alias / function 仓库。一个文件一个职责，热加载。

## 安装

```sh
brew install fd          # f 命令依赖
./install.sh             # 在 ~/.zshrc 追加 source 行
exec zsh                 # 重载
```

## 当前内容

- `f <pattern> [path]` — 用 fd 模糊查找文件，替代 `find . -name "*xxx*"`

  ```sh
  f 微信公众号
  f config.ts src/
  ```

## 加新东西

- 新函数：在 `functions/` 下加 `*.zsh`
- 新 alias：在 `aliases/` 下加 `*.zsh`

下次打开终端自动生效（已 source 整个目录）。

## 为什么不是 Nix / chezmoi

KISS。当前只有几个 alias 和函数，纯 zsh + git 足够。等需要跨机器同步整套环境（brew 包、应用配置、launchd）再升级。
