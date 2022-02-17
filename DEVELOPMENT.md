# 開発者向け情報

japanese-otf-mirror リポジトリは，以下の目的で用意しています：

- japanese-otf(-uptex) の TFM/VF をビルドするために必要な
  (u)ppltotf, ovp2ovf などのツールの修正・更新に問題が含まれないことを確認するため。
    - Git で生成済みの TFM/VF を管理しているため，
      `make` 時に "Binary files differ" が出る変更点を調査すればよいことになります。
- 日本語 TeX 開発コミュニティ版の (u)pLaTeX や jsclasses
  で導入された修正・新仕様下で問題が起きないことを確認するため。
    - OTF パッケージを使用するテストケースを本リポジトリに用意することで，事前に
      (u)pLaTeX や jsclasses との共存をチェックする予定です。
    - 仮に OTF パッケージ側の改良が必要となった場合，本リポジトリで
      branch を切って開発し，upstream に報告する可能性もあるかもしれません。
- 日本語 TeX 開発コミュニティで検討・提案する修整、機能拡張を管理するため。
    - 原作を尊重し開発の意図を損なわない範囲での小さな修整や機能拡張を目指します。
    - CTANには「日本語 TeX 開発コミュニティ版」と明示して投稿します。

このリポジトリにあるものが公式の upstream ではないことに注意してください。
それぞれの公式は [README.md](./README.md) に記載のあるとおりです。

## インストール手順

`make install` でインストールします。現時点では
hiraprop は Makefile のインストール対象に含めていません（準備中）。

## 公式ソースからの違い

公式の upstream から取得したアーカイブに，いくつかの変更が加えてあります。

### japanese-otf

#### trunc branch

- Obtain and extract `http://psitau.kitunebi.com/otf1.7b8.zip`
- Rename `readme.txt` -> `readme-ja.txt`
- `chmod +x makeotf mkjvf`
- Convert all files in `script/` and `test/` from CRLF -> LF
- `make` (at top directory)
- Add `README` and `README.nonfree`

#### master branch

- Apply several patches from trunc branch.
    - avoid a warning for opening dirhandle
    - build tfm/vf/ofm for gteb font series
    - omit entries in vf for unused character numbers
    - support halfwidth katakana in \UTF{}, \UTFM{}
    - fix typo
- Add `TeXLive-maps/otf-cktx.map`
- `./makeotf` (at `japanese-otf` directory)

### japanese-otf-uptex

- Obtain and extract `https://github.com/t-tk/japanese-otf-uptex/releases/tag/v0.27`
- `make` (at top directory)
- Add `README` and `README.nonfree`

### hiraprop

- Obtain and extract `http://psitau.kitunebi.com/hiraprop.zip`
- Import `map/hiraprop.map` from `https://texlive.texjp.org/current/tltexjp/`
  (though already supported by `kanji-config-updmap.pl` in ptex-fontmaps)

## リリース手順

現状 CTAN へは upstream からでなく，本リポジトリから「日本語 TeX 開発コミュニティ版」として
アップロードしています。

その際，CTAN へアップロードするためのアーカイブ (.tar.gz) は
`release.sh` を実行すれば作成することができます。

````
    $ ./release.sh [パッケージ名]
````

を実行します（`[パッケージ名]` は japanese-otf，japanese-otf-uptex 又は
hiraprop のいずれか）。CTAN へのアップロードでは，TeX Live に敢えて収録しない
nonfree サポートファイル（具体的には，ヒラギノフォントを使用するための
TFM/VF/OFM のセット）を分割し，別のアーカイブとします。本体の方のみ
CTAN に登録し，nonfree の方は [TLContrib](http://contrib.texlive.info)
([Git repository](https://git.texlive.info/tlcontrib))
で配布します。

japanese-otf，japanese-otf-uptex を統合したアーカイブは
`release-merged.sh` を実行すれば作成することができます。

````
    $ ./release-merged.sh
````

----
Japanese TeX Development Community
