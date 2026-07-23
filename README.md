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

- `fd <exact-name> [path]` — 递归查找同名文件和文件夹，列出结果并确认后批量删除

  ```sh
  fd node_modules
  fd .DS_Store ~/projects
  ```

  该函数会覆盖交互式 shell 中同名的 `fd` 命令；需要直接调用原始
  `fd` 查找工具时，使用 `command fd ...`。现有的 `f` 已自动这样处理。

## 加新东西

- 新函数：在 `functions/` 下加 `*.zsh`
- 新 alias：在 `aliases/` 下加 `*.zsh`

下次打开终端自动生效（已 source 整个目录）。

## 为什么不是 Nix / chezmoi

KISS。当前只有几个 alias 和函数，纯 zsh + git 足够。等需要跨机器同步整套环境（brew 包、应用配置、launchd）再升级。
