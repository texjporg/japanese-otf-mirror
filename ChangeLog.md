# 2025-07-24 japanese-otf

Based on japanese-otf-uptex Ver.0.32.

japanese-otf-uptex:
* Support Unicode variation sequences (SVS)
  in Chinese/Korean plain text.
* Enable to use Unicode/CID base multi-weight virtual fonts
  for \UTF*{}, \CID*{} macros with platex.
* Add option 'subfont' to use conventional virtual fonts
  by subfont scheme for \UTF*{}, \CID*{} macros with platex.

For platex only:
* Remove conventional vf's and tfm's by subfont scheme for
  \UTF{C,T,K}{}, \CID{C,T,K}{} macros from the archive.



# 2025-02-18 japanese-otf

Based on japanese-otf-uptex Ver.0.31.

japanese-otf-uptex:
* Support Unicode variation sequences (SVS, IVS)
  and combined characters in Japanese plain text.
* Fix typo related to Adobe-GB1-6 support.
* Update reference Unicode Blocks-17.0.0.txt.



# 2023-10-09 japanese-otf

Based on japanese-otf-uptex Ver.0.30.

japanese-otf-uptex:
* Fix issue related to ruby of extra bold.
* Fix issue related to insertion of penalty before \CID{}
* Update reference Unicode Blocks-15.1.0.txt, Adobe-GB1-6 cid2code.txt (Version 09/21/2023).



# 2023-06-25 japanese-otf

Based on japanese-otf-uptex Ver.0.29.

Common between platex and uplatex:
* otf.sty: Add an option 'noruby' not to use kana glyphs optimized for ruby.
* Fix bug on *brsgnmlminl, *nmlgotheb.
* Fix issue related to \kanjishape

japanese-otf-uptex:
* Extended CID base multi-weight fonts (seven sets of family/series) in \CID{}, \CIDC{}, \CIDT{}, \CIDK{}.
It enables to typeset multi-weights for macros \CIDC{}, \CIDT{}, \CIDK{}.



# 2023-02-23 japanese-otf

Based on japanese-otf-uptex Ver.0.28.

Common between platex and uplatex:
* otf.sty: Set option autodetect-engine default. Add a new option platex to check if engine is platex.

japanese-otf-uptex:
* Support Kana Letter Small Ko defined by Unicode 15.0.
* Update reference Unicode Blocks-15.0.0.txt, Adobe-Japan1-7 cid2code.txt (Version 05/18/2022).



# 2022-03-05 japanese-otf

japanese-otf:
* set FONTDIR RT in OFM for pTeX vertical writing. (TeX JP org extension)
  They work with dvips 2022.1 (r62223 or later).
  https://github.com/texjporg/japanese-otf-mirror/issues/15
  https://github.com/texjporg/tex-jp-build/issues/135

japanese-otf-uptex:
* update samples.



# 2022-02-17 japanese-otf(-uptex)

Based on otfbeta v1.7b8 (2019/04/01) and japanese-otf-uptex Ver.0.27.
The contents of japanese-otf-uptex for CTAN have been merged into the package of japanese-otf for CTAN (Japanese TeX Development Community edition).

japanese-otf:
* supported halfwidth Katakana in \UTF{} (TeX JP org extension)
* shrunk data size of virtual fonts (TeX JP org extension)

japanese-otf-uptex:
* introduced multi-weight virtual fonts for Chinese/Korean plain texts.



# 2020-11-14 japanese-otf(-uptex)

Based on otfbeta v1.7b8 (2019/04/01) and japanese-otf-uptex Ver.0.26.

japanese-otf:
* Fix typo in script/mkaltutfvf.pl

japanese-otf-uptex:
* Introduce Unicode base multi-weight virtual fonts for \UTF{}, \UTFC{}, \UTFT{}, \UTFK{}.
* Shrink file size of some virtual fonts for main text.



# 2020-02-29 japanese-otf-uptex

Based on japanese-otf-uptex Ver.0.25.

japanese-otf-uptex:
* Update references: Adobe-Japan1-7 cid2code.txt (Version 07/30/2019).



# 2019-09-07 japanese-otf-uptex

Based on japanese-otf-uptex Ver.0.24.

japanese-otf-uptex:
* Make half width U+00B7 in some VFs.



# 2019-04-02 japanese-otf(-uptex)

Based on otfbeta v1.7b8 (2019/04/01) and japanese-otf-uptex Ver.0.23.

japanese-otf:
* ajmacros.sty: Support Japanese new era "Reiwa" in \ajLig{}.
* mkcidvf.pl, mkmlcidvf: Make font head Adobe-Japan1-7, Adobe-GB1-5, Adobe-CNS1-7.
* mkcidofm.pl: Output CID code up to 23059 in OFM.

japanese-otf-uptex:
* otf.sty: Sync with japanese-otf.
* script/*: Add more proportional kana support ("Koto", "Yori") for Hiragino fonts.
* Update reference Unicode Blocks-12.0.0.txt.



# 2018-12-08 japanese-otf-uptex

Based on japanese-otf-uptex Ver.0.22.

japanese-otf-uptex:
* Bug fix on U+3090..3093.



# 2018-05-13 japanese-otf-uptex

Based on otfbeta v1.7b7 (2018/02/01) and otfbeta-uptex Ver.0.21.

japanese-otf-uptex:
* Add dou­ble ex­cla­ma­tion marks etc. (U+203C, U+2047, U+2048, U+2049) to char_type 6.
* Add -hk op­tion to en­able halfwidth katakana let­ters in hi­raprop.



# 2018-04-07 japanese-otf-uptex

Based on otfbeta v1.7b7 (2018/02/01) and otfbeta-uptex Ver.0.20.

japanese-otf-uptex:
* Add parentheses e.g. guillemets to char_type 1 & 2 (sync with uptex-fonts).



# 2018-02-11 japanese-otf(-uptex)

Based on otfbeta v1.7b7 (2018/02/01) and otfbeta-uptex Ver.0.19.

japanese-otf:
* otf.sty: Scale Japanese fonts using \Cjascale if defined. Support jsreport.cls in jsclasses.
* ajmacros.sty: Add \NeedsTeXFormat{pLaTeX2e} to avoid infinite loop.

japanese-otf-uptex:
* otf.sty: Sync with japanese-otf.
* otf.sty: Set default latin font T1 for upLaTeX.
* otf.sty: add {,u}pLaTeX engine check and a package option "autodetect-engine".
* Add U+00B7 to char_type 3 (sync with uptex-fonts).
* Update reference Unicode Blocks-10.0.0.txt.

