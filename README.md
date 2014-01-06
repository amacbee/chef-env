Cookbook for 最低限の開発環境構築
==============
Zsh+Emacs+Tmuxが導入された最低限の開発環境を構築するための Cookbook

Requirements
------------
以下の2つのCookbookが事前に導入されている必要があります(どちらも公式)．

 - yum
 - yum-epel

Usage
-----
Just include `env` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[env]"
  ]
}
```

Contributing
------------
 1. Fork the repository on Github
 2. Create a named feature branch (like `add_component_x`)
 3. Write you change
 4. Write tests for your change (if applicable)
 5. Run the tests, ensuring they all pass
 6. Submit a Pull Request using Github

License and Authors
-------------------
<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.ja">
  <img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
</a>

License: [クリエイティブ・コモンズ 表示 - 継承 3.0 非移植](http://creativecommons.org/licenses/by-sa/3.0/deed.ja)<br/>
Author(s): [@beeEaMa](https://twitter.com/beeEaMa)
