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

このリポジトリにあるものが公式の upstream ではないことに注意してください。
それぞれの公式は [README.md](./README.md) に記載のあるとおりです。

## インストール手順

`make install` でインストールします。現時点では
hiraprop は Makefile のインストール対象に含めていません（準備中）。

## 公式ソースからの違い

公式の upstream から取得したアーカイブに，いくつかの変更が加えてあります。

### japanese-otf

- Obtain and extract `http://psitau.kitunebi.com/otf1.7b7.zip`
- Rename `readme.txt` -> `readme-ja.txt`
- `chmod +x makeotf mkjvf`
- Convert all files in `script/` and `test/` from CRLF -> LF
- `patch -p1 <otf-script-gteb.diff`
    - avoid a warning for opening dirhandle
    - build tfm/vf/ofm for gteb font series
- `make` (at top directory)
- Add `README`, `README.nonfree` and `TeXLive-maps/otf-cktx.map`

### japanese-otf-uptex

- Obtain and extract `http://www.t-lab.opal.ne.jp/tex/otfbeta-uptex-0.18.tar.xz`
- (to be added soon)

### hiraprop

- Obtain and extract `http://psitau.kitunebi.com/hiraprop.zip`
- Import `map/hiraprop.map` from `https://texlive.texjp.org/current/tltexjp/`
  (though already supported by `kanji-config-updmap.pl` in ptex-fontmaps)

## リリース手順

CTAN へアップロードするためのアーカイブ (.tar.gz) は
`release.sh` を実行すれば作成することができます。

````
    $ ./release.sh [パッケージ名]
````

を実行します（`[パッケージ名]` は japanese-otf，japanese-otf-uptex 又は
hiraprop のいずれか）。CTAN へのアップロードでは，TeX Live に敢えて収録しない
nonfree サポートファイル（具体的には，ヒラギノフォントを使用するための
TFM/VF/OFM のセット）を分割し，別のアーカイブとします。

----
Japanese TeX Development Community
