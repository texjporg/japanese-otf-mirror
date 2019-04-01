OTFパッケージ開発版（v1.7b8 2019/04/01）
齋藤修三郎

【ライセンス】
修正 BSDとします．

【必要な物】
・ovp2ovf：WEB版のものだと確実にうまくいきます．C版の場合、2011年12月以降のVersionでしたらうまくいきます．
・opl2ofm：WEB版のものだと確実にうまくいきます．C版の場合、2011年12月以降のVersionでしたらうまくいきます．
・perl
・ppltotf

【インストール】
１）シェルスクリプトmakeotfを実行してください（必要なら実行属性を付けてください）．
　　（mkjvfにも実行属性が付いている必要があります）

２）処理が終わると同じ階層にvf, tfm, ofmというフォルダが作成されます．適切な場所に移動させてください．

３）styファイル等を適当な場所に移動させてください．必要が有れば，mktexlsrを実行してください．

４）divpsのマップファイルに（例えば）hiragino.map(for udvips)に書かれたエントリを追加します．

５）dvipdfmxのマップファイルに（例えば）hiraginox.map(for dvipdfmx)に書かれたエントリを追加します．

６）繁體字，簡体字，ハングルなどを使用する場合，ckt.map(for udvips), ckt.map(for dvipdfmx)に
　　書かれたエントリを追加して下さい．
　　Distillerの「フォントの場所」にMSungStd-Light-Acroなどが入っているフォルダを追加すれば，
　　繁體字，簡体字，ハングルなども埋め込めます（明朝体のみ）．

アジアンフォントパックは下記のURLから入手出来ます．
http://www.adobe.com/products/acrobat/acrrasianfontpack.html


【使用法】
otf.styになって追加されたオプションとして，deluxe, multi, bold, noreplaceがあります．

deluxeを指定すると，mc/m/n, mc/bx/n, gt/m/n, gt/bx/nを別々のフォントに割り当てるようにします．
丸ゴシックも使えるようになります．\mgfamilyを宣言すると丸ゴシックになります．（勿論割り当てられたフォント次第です）

【注意】
アスキーの標準クラスファイルでは見出しなどのフォントに\bfseriesが指定されているだけです．処理結果で（太字の）ゴシック
で表示されていたのはmc/bx --> gt/mに代替されていたからです．同様の結果を得るためには\bfseriesを\gtfamily\bfseries
に変更する必要があります．これを行うためのスタイルファイルがredeffont.styです．deluxeオプションを使用するときは，
このスタイルファイルを読み込んでください．（自動では読み込まれません）
redeffont.styでは，見出しがgt/bxに割り当てられているフォントになります．これを例えばgt/mにしたい場合，\headfontを
書き換えることで可能です．プリアンブルで
\let\headfont=\gtfamily
としてください．

multiを指定すると，Unicodeの漢字の部分を簡体字，繁體字，朝鮮語のそれぞれのフォントを利用することが
出來ます．簡体字は\UTFCを，繁體字は\UTFTを，朝鮮語は\UTFKを，それぞれ使います．
（残念乍ら，deluxeオプションを指定しても，効果は及びません）
また，\UTFMを用いると，もし日本語のフォントにグリフがない場合，繁體字＞簡体字＞ハングルの順番で
グリフがないかを調べ，何れかにグリフがある場合，そのフォントのグリフが用いられます．
CIDによる指定は，簡体字は\CIDCを，繁體字は\CIDTを，朝鮮語は\CIDKを，それぞれ使います．

【注意】otf.styはデフォルトの明朝体，ゴシック体を置き換えます．
◇gt/mをどのように置き換えるかを変更するオプションがboldオプションです．デフォルトではgt/mには
レギュラーのゴシックを割り当てますが，boldオプションを指定するとボールドのゴシックを割り当てます．

◇noreplaceを指定すると，デフォルトの明朝体，ゴシック体を置き換えないようになります．
ただし，deluxe, expertオプションが指定されるとnoreplaceは無効になります．

\usepackage[deluxe, expert, multi]{otf}
でオプションが全て有効になります．（フォントのshapeがたくさん定義され無駄が増えます．）

◇burasageオプションが指定されると，ぶら下げ組をするようになります．但し，ちょうど行末に来た句読点は全角取りになります．
ルビ用のフォントには適用されません．

◇jis2004オプションが指定されると，JIS X 0213:2004で行われた例示字形の変更による字形を表示するようになります．
ルビ用のフォントおよび\ebseriesには適用されません．
また，実際に使用するフォントによっては字形の変更が行われないことがあります．

◇scaleオプション［v1.7b6以降］
フォントを宣言するときに明示的にscaleを指定したい場合に使用します．
\usepackage[scale=1.0]{otf}
で，欧文10ptに対して，和文も10ptになります．
尚，宣言しない場合，jsクラスを使用していればscale=0.92469，それ以外のクラスファイルの場合，scale=0.962216となります．


【おまけ】mkjvfについて
生成スクリプトの中で使っているmkjvfはovp2ovfを利用してVFを作成するperlスクリプトです．
それ自体でも使えますので，ご利用戴ければ幸いです．
makejvfとの違いは，
・TFMをちゃんと読み込まない．
・長体／平体には対応していない．
・UTF/OTFパッケージ用ですが，仮名のフォントにルビ用かな，縦組／横組専用かなを割り当てたVFを作成可能
・マッピングのカスタマイズが比較的簡単
です．TFMをちゃんと読み込まないので，生成出来るのはJIS TFMベースです，min10のような複雑な
文字幅には対応していません．

【使用許諾】
本パッケージのインストールまたは使用に関連して使用者に直接的または間接的に発生する一切の損害
（ハードウェア、他のソフトウェアの破損、不具合等を含む。また、通常損害、特別損害、結果損害を
問わない）および第三者からなされる請求について著作権者は一切責任を負担しません。
本パッケージを使用して得られる結果は、商用、非商用に関わらず無償で使用することが可能です。
自己責任で使用してください。本パッケージを使用した場合、上記の記載事項に同意したものと見なし
ます。

【変更履歴】
v1.7b7-->v1.7b8(2019/04/01)
・新元号に対応．[ajmacros.sty]
・typoを修正．[redeffont.sty]
・vfのfontheadをAdobe-Japan1-7, Adobe-GB1-5, Adobe-CNS1-7に変更．[mkcidvf.pl, mkmlcidvf.pl]
・OFMをCID23059まで出力されるように変更．[mkcidofm.pl]
v1.7b6-->v1.7b7(2018/02/01)
・jsreportを使用した場合もscale=0.92469となるようにしました．[otf.sty]
・クラスファイルで\Cjascaleが定義されている場合，scale=\Cjascaleとなるようにしました．[otf.sty]
・ajmacros.styに\NeedsTeXFormat{pLaTeX2e}を追加．[ajmacros.sty]
v1.7b5-->v1.7b6(2013/11/17)
・scaleオプションの追加．[otf.sty]
（実装は，Z.R.さんのBXjsclsパッケージを参考にさせていただききました）
v1.7b4-->v1.7b5(2012/4/11)
・noreplaceオプション使用時で，\if@enablejfamが定義されていない場合，エラーとなる不具合を修正．Z.R.さんによる修正を取り込ませていただきました（上田さん，前田さん，山本さん，Z.R.さんありがとうございます）．[otf.sty]
v1.7b3-->v1.7b4(2012/1/22)
・黒木裕介さんによる，朝鮮語の組版するための補助ファイルの追加．詳しくはhttp://ptetexwin.sourceforge.jp/jkexample/を参照のこと．
　[otf-hangul.dfuの追加, koreanexample.texの追加]
v1.7b1-->v1.7b3(2011/10/28)
・修正 BSDライセンスを適用[COPYRIGHTの追加]
v1.7b1-->v1.7b2(2010/7/30)
・mkjvfから作成されるVFが，新しいovp2ovf (ver. 2.1)で作った場合，上手く作成されない不具合を修正しようとしたが上手くいかなったため没に[mkjvf]
v1.5.6.1-->v1.7b1(2010/3/27)
・ぶら下げ組に対応[otf.sty, makeotf, mkjvf, brsg-h.plおよびbrsg-v.pl追加, brsgtest.texの追加]
・JIS X 0213:2004の字形改正に対応
　[otf.sty, makeotf, mkjvf, hiragino.map(for udvips), hiraginox.map(for dvipdfmx), jis2004.texの追加]
v1.5.6-->v1.5.6.1(2010/3/26)
・mkutfvf.plにspeed up patchを適用が上手くいっていなかったのを修正[mkutfvf.pl]
v1.5.5-->v1.5.6(2010/3/22)
・シェルスクリプト内のpltotfをppltotfに変更[makeotf]
・Windows用のバッチファイル(mkotf.bat)を削除
・新しいovp2ovf, opl2ofmでovf, ofmが作成できるようにOFMLEVELエントリを追加
　[mkvpkana.pl, mkutfvf.pl, mkcidvf.pl, mkpkana.pl, mkcidofm.pl, mkaltutfvf.pl,
　mkmlcidvf.pl, mkpropofm.pl, mkjvf]
・mkutfvf.plに土村展之さんのspeed up patchを適用させて戴く[mkutfvf.pl]
・uplatexに対応するようスタイルファイルを修正[otf.sty, mlcid.sty, mlutf.sty]
・山本和義さんのご指摘により，disablejfamを使用しない場合の定義を修正[otf.sty]
v1.5.4-->v1.5.5(2010/3/20)
・クラスファイルのオプションにてdisablejfam使用時の不具合を修正[otf.sty]
v1.5.3-->v1.5.4(2007/3/19)
・縦書き用のOFMのメトリックが間違っていたのを修正[mkcidofm.pl]
v1.5.2.1-->v1.5.3(2006/9/6)
・プロポーショナル仮名用tfmの作成方法がおかしかったのを修正[mkotf, mkotf.bat]
v1.5.1-->v1.5.2.1(2005/12/31)
・マクロ集の修正(\ajSlantedと\ajSlanted*の定義の入れ換え)[ajmacros.sty]
v1.5.1-->v1.5.2(2005/5/11)
・縦書きCID用のVF, OFMのメトリックがおかしかったのを修正[mkcidvf.pl, mkofm.pl]
v1.5-->v1.5.1(2005/1/27)
・マクロ集の修正[ajmacros.sty]
v1.3.4-->v1.5(2005/1/16)
・Adobe-Japan1-6に対応[otf.sty, ajmacros.sty, mktfm.pl, mkcidvf.pl, mkcidofm.pl, kozuka.map, kozukax.map]
v1.3.3-->v1.3.4(2004/8/17)
・ajmacros.styを読み込まないオプションをnomacrosに修正[otf.sty]
v1.3.2-->v1.3.3(2004/4/17)
・"のcatcodeを強制的に12にするように変更[otf.sty, mlcid.sty, mlutf.sty]
v1.3.1.1-->v1.3.2(2004/3/5)
・マクロ集に合字マクロの追加[ajmacros.sty]
v1.3.1-->v1.3.1.1(2004/2/25)
・VF生成スクリプトを修正[mkutfvf.pl, mkcidvf.pl, mkaltutfvf.pl, mkmlcidvf.pl, mkjvf, mkotf.bat]
v1.3.0-->v1.3.1(2004/2/18)
・CVS版のdvipdfmxに対応するためOFMファイルを作成するようにした[makeotf, mkotf.bat, mkofm.pl, mkofm2.pl]
・プロポーショナル仮名のVFを変更[mkpkana.pl, mkvpkana.pl]
・上記の変更により，マップファイルをエントリを追加[hiraginox.map(for dvipdfmx), hiragino.map(for udvips)]
v1.1.6-->v1.3.0(2004/2/7)
・明朝体，ゴシック体の置き換え用のフォントのファミリをmc, gtからhmc, hgtに変更[otf.sty]
v1.1.5-->v1.1.6(2004/2/2)
・縦書き用プロポーショナル仮名の追加[mkotf, mkotf.bat, mkvpkana.pl, tfm, vf, otf.sty]
v1.1.4-->v1.1.5(2004/1/19)
・redeffont.styのJIS X 0213パッケージに対する対応[redeffont.sty]
・フォント定義用の内部マクロの（井上浩一氏による）改良[otf.sty]
v1.1.3-->v1.1.4(2003/12/19)
・フォント定義用の内部マクロの（井上浩一氏による）改良[otf.sty, mlotf.sty, mlcid.sty]
・dvipdfmx用のフォントマップファイルを20031207版のものに変更[各種マップファイル]
v1.1.2-->v1.1.3(2003/12/17)
・CIDによる指定を多言語に対応させました（とりあえず，全て全角幅にしています）
　[makeotf, mkotf.bat, mktfm.pl, mkmlcidvf.pl, tfm, vf, mlcid.sty, fontmap]
v1.1.1-->v1.1.2(2003/11/27)
・プロポーショナル仮名用のJFM, VFをOTFパッケージ標準のメトリックに準拠するようにした[mkpkana.pl, tfm, vf]
v1.1-->v1.1.1(2003/11/25)
・redeffont.styにおいて{j, t}book.clsを使った場合にコンパイルできなかった不具合を修正[redeffont.sty]
v1.1b8-->v1.1(2003/11/17)
・丸ゴシックのファミリーに切り替える\textmgコマンドを追加[otf.sty]
v1.1b8-->v1.1b9, v1.0.4-->v1.0.5(2003/11/3)
・フォント名を実際の物に合わせた[morisawax.map(for dvipdfmx)]
・ヒラギノ明朝体W2のエントリを追加[hiraginox.map(for dvipdfmx), hiragino.map(for udvips)]
v1.1b7-->v1.1b8, v1.0.3-->v1.0.4(2003/11/2)
・redeffont.styで\headfontを再定義しても，正しく置き変わらなかった不具合を修正[redeffont.sty]
v1.1b6-->v1.1b7(2003/10/31)
・縦組み用のVFでコンマ，ピリオドを句読点に変更する機能の修正[mkjvf, vf]
v1.1b5-->v1.1b6(2003/10/27)
・nmlminr-vなどでミニュートへの変換の際のフォント名を取得できていなかったのを修正[mkjvf, vf]
v1.1b4-->v1.1b5(2003/10/27)
・property list filesの文字コードをJISに変更[basepl]
縦組み用のVFでクォーテーションマークをミニュートに変更する機能の修正[mkjvf, vf]
v1.1b3-->v1.1b4(2003/10/25)
・縦組み用のVFでクォーテーションマークをミニュートに変更する機能の修正[mkjvf, vf]
・縦組み用のVFでコンマ，ピリオドを句読点に変更[mkjvf, vf]
v1.1b2-->v1.1b3(2003/10/25)
・mkjvfを小仮名が作成できるように変更[mkjvf]
v1.1b-->v1.1b2(2003/10/24)
・縦組み用のVFでクォーテーションマークをミニュートに変更[mkjvf, vf]
v1.0.2-->v1.1b(2003/10/22)
・JFMにおいて0.962216倍していたのをスタイルファイル側でスケールするように修正[mkjvf, vf, tfm]
・多言語用のフォントがjsclassesに対応しわすれていたのを修正[mlutf.sty]
・extrafontsを取り込んだ，ヒラギノ明朝W2用のvf, tfmを追加[otf.sty, vf, tfm]
v1.0-->v1.0.2(2003/9/03)
・横／縱組専用仮名，およびルビ専用仮名が縮小されてしまっていたバグを修正．[mkjvf, vf]
v1.0-->v1.0.1(2003/8/18)
・クォーテーションマークがずれるバグを修正．[mkjvf, vf]
v1.0b5-->v1.0(2003/5/1)
・windows用のバッチファイルの名称を変更
・mkjvfを最新の物にアップデート
v1.0b4-->v1.0b5(2003/3/25)
・hyperref.styが読み込まれている場合，\UTFコマンドなどで指定された文字に対してoutlineファイルへの
　書き出しが\0xXXXXという形で書き出されるようになりました．[ajmacros.sty, otf.sty, mlutf.sty]
v1.0b3-->v1.0b4(2003/3/25)
・hyperref.styが読み込まれている場合の変更を取りやめました．[ajmacros.sty, otf.sty]
v1.0b2-->v1.0b3(2003/3/24)
・hyperref.styが読み込まれている場合，\UTF{XXXX}で指定された部分を
　$XXXXという形式でoutlineファイルに書き出すように変更[otf.sty]
・\UTFMコマンドを新設，\UTFM用のVF, TFMを生成するようにしました．
　それに伴い，フォントマップの例を変更しました．[mlutf.sty, vf, tfm, fontmap]
・hyperref.styが読み込まれている場合，\ajVarがoutファイルに書き出されるとき
　引数が書き出されるようになりました．[ajmacro.sty]
v1.0b1-->v1.0b2(2003/3/17)
・mkutfvf.plのバグを修正．日本語以外には必要ないVFまで作成していました．[mkutfvf.pl]
v1.0b0-->v1.0b1(2003/3/17)
・mkjvfの余分なコードを消去[mkjvf]
