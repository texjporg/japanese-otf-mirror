UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex -kanji=utf8
DVIPS = dvips
DVIPDFMX = dvipdfmx -v
PDVITYPE = pdvitype

JPOTF = ../../..
MYFONTDIR = /please/set/personal/fontdir

export TEXINPUTS := .;${JPOTF}/japanese-otf-uptex/sty/;${JPOTF}/japanese-otf/sty/;$$TEXMF/tex/{platex,latex,generic,}//
export VFFONTS := .;${JPOTF}//vf/;$$TEXMF/fonts/vf//
export TFMFONTS := .;${JPOTF}//tfm/;{$$TEXMF/fonts,$$VARTEXFONTS}/tfm//
export OFMFONTS := .;${JPOTF}//ofm/;{$$TEXMF/fonts,$$VARTEXFONTS}/{ofm,tfm}//
export OPENTYPEFONTS := .;${MYFONTDIR}//;$$TEXMF/fonts/{opentype,truetype}//;$$OSFONTDIR//


uplatex-version:
	uplatex --version

euptex-version:
	euptex --version

xdvipdfmx-version:
	xdvipdfmx --version

dvipdfmx-version:
	xdvipdfmx --dvipdfmx --version
	which xdvipdfmx

which-otf-sty:
	-@kpsewhich otf.sty
	-@kpsewhich mlutf.sty
	-@kpsewhich mlcid.sty
	-@kpsewhich ajmacros.sty

which-exp-vf:
	-@kpsewhich -format vf upexpminr-h.vf
	-@kpsewhich -format vf upexpminr-v.vf

which-exp-tfm:
	-@kpsewhich -format tfm upexpminr-h.tfm
	-@kpsewhich -format tfm upexpminr-v.tfm

which-cmr-tfm:
	-@kpsewhich -format tfm cmr10.tfm
	-@kpsewhich -format tfm cmbx12.tfm
	-@kpsewhich -progname=dvipdfmx -format tfm cmr10.tfm
	-@kpsewhich -progname=dvipdfmx -format tfm cmbx12.tfm

which-cjmr-tfm:
	-@kpsewhich -format tfm otf-cjmr-h.tfm
	-@kpsewhich -format tfm otf-cjmr-v.tfm

which-cjmr-ofm:
	-@kpsewhich -format ofm otf-cjmr-h.ofm
	-@kpsewhich -format ofm otf-cjmr-v.ofm

which-ucgb-tfm:
	-@kpsewhich -format tfm otf-ucgb-h.tfm
	-@kpsewhich -format tfm otf-ucgb-v.tfm

which-hara-otf:
	-@kpsewhich -format "opentype fonts" HaranoAjiMincho-Regular.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiMincho-Bold.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiMincho-Light.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothic-Normal.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothic-Medium.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothic-Bold.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothic-Heavy.otf

which-hara-ck-otf:
	-@kpsewhich -format "opentype fonts" HaranoAjiMinchoCN-Regular.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothicCN-Medium.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiMinchoTW-Regular.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothicTW-Medium.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiMinchoK1-Regular.otf
	-@kpsewhich -format "opentype fonts" HaranoAjiGothicK1-Medium.otf

which-koz-otf:
	-@kpsewhich -format "opentype fonts" KozMinPr6N-Regular.otf
	-@kpsewhich -format "opentype fonts" KozGoPr6N-Medium.otf
	-@kpsewhich -format "opentype fonts" AdobeSongStd-Light.otf
	-@kpsewhich -format "opentype fonts" AdobeMingStd-Light.otf
	-@kpsewhich -format "opentype fonts" AdobeMyungjoStd-Medium.otf

which-iplx-otf:
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Regular.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Light.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-ExtraLight.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Medium.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-SemiBold.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Bold.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Text.otf
	-@kpsewhich -format "opentype fonts" IBMPlexSansJP-Thin.otf

which-dvipdfmx-cfg:
	kpsewhich -progname=dvipdfmx -format=othertext dvipdfmx.cfg

which-map:
	-@kpsewhich -format "map" utfmacro-haranoaji.map
	-@kpsewhich -format "map" utfmacro-kozuka.map
	-@kpsewhich -format "map" jotf-psfonts.map

which-cmap:
	-@kpsewhich -format "cmap files" UniJIS-UTF16-H
	-@kpsewhich -format "cmap files" UniJIS-UTF16-V
	-@kpsewhich -format "cmap files" UniGB-UTF16-H
	-@kpsewhich -format "cmap files" UniGB-UTF16-V
	-@kpsewhich -format "cmap files" UniCNS-UTF16-H
	-@kpsewhich -format "cmap files" UniCNS-UTF16-V
	-@kpsewhich -format "cmap files" UniKS-UTF16-H
	-@kpsewhich -format "cmap files" UniKS-UTF16-V

which-cid-tex:
	-@kpsewhich uotf-cid-h.tex
	-@kpsewhich uotf-cid-v.tex


all: otf sp art brsg jis04 scale prop punct exclam dir

otf: uplatex-otf platex-otf
sp: uplatex-sp platex-sp
art: uplatex-article platex-article
brsg: uplatex-brsg platex-brsg
jis04: uplatex-jis04 platex-jis04
scale: uplatex-scale platex-scale
prop: uplatex-prop platex-prop
exclam: uplatex-exclam platex-exclam
utfmacro: uplatex-utfmacro platex-utfmacro
dir: uplatex-dir platex-dir

uplatex-otf:
	for opt in default deluxe expert deluxe,expert bold noreplace; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-h-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$optx-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-v-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$optx-v-uplatex.dvi ; \
	done

platex-otf:
	for opt in default deluxe expert deluxe,expert bold noreplace; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-h-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$optx-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-v-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$optx-v-platex.dvi ; \
	done

uplatex-otf-haranoaji: uplatex-otf
	for opt in expert,noruby deluxe,expert,noruby; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-v-uplatex.dvi ; \
	done
	for opt in deluxe expert deluxe,expert expert,noruby deluxe,expert,noruby; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotftest-$$optx-h-hara-uplatex.pdf uotftest-$$optx-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotftest-$$optx-v-hara-uplatex.pdf uotftest-$$optx-v-uplatex.dvi ; \
	done

uplatex-otf-kozuka: uplatex-otf
	for opt in deluxe expert deluxe,expert; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotftest-$$optx-h-koz-uplatex.pdf uotftest-$$optx-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotftest-$$optx-v-koz-uplatex.pdf uotftest-$$optx-v-uplatex.dvi ; \
	done

platex-otf-haranoaji: platex-otf
	for opt in expert,noruby deluxe,expert,noruby; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$optx-v-platex.dvi ; \
	done
	for opt in deluxe expert deluxe,expert expert,noruby deluxe,expert,noruby; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotftest-$$optx-h-hara-platex.pdf uotftest-$$optx-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotftest-$$optx-v-hara-platex.pdf uotftest-$$optx-v-platex.dvi ; \
	done

platex-otf-kozuka: platex-otf
	for opt in deluxe expert deluxe,expert; do \
		optx=`echo $$opt | sed -e 's/,/_/g'` ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotftest-$$optx-h-koz-platex.pdf uotftest-$$optx-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotftest-$$optx-v-koz-platex.pdf uotftest-$$optx-v-platex.dvi ; \
	done

uplatex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-uplatex.dvi ; \
	done

platex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-platex.dvi ; \
	done

uplatex-sp-haranoaji: uplatex-sp
	for opt in deluxe expert; do \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-sp-$$opt-h-hara-uplatex.pdf uotf-sp-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-sp-$$opt-v-hara-uplatex.pdf uotf-sp-$$opt-v-uplatex.dvi ; \
	done

uplatex-sp-kozuka: uplatex-sp
	for opt in deluxe expert; do \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-sp-$$opt-h-koz-uplatex.pdf uotf-sp-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-sp-$$opt-v-koz-uplatex.pdf uotf-sp-$$opt-v-uplatex.dvi ; \
	done

platex-sp-haranoaji: platex-sp
	for opt in deluxe expert; do \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-sp-$$opt-h-hara-platex.pdf uotf-sp-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-sp-$$opt-v-hara-platex.pdf uotf-sp-$$opt-v-platex.dvi ; \
	done

platex-sp-kozuka: platex-sp
	for opt in deluxe expert; do \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-sp-$$opt-h-koz-platex.pdf uotf-sp-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-sp-$$opt-v-koz-platex.pdf uotf-sp-$$opt-v-platex.dvi ; \
	done

uplatex-cid-compile:
	for opt in default deluxe bold expert dlxexp; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotf-cid-h.tex ; \
		mv uotf-cid-h.dvi uotf-cid-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotf-cid-v.tex ; \
		mv uotf-cid-v.dvi uotf-cid-$$opt-v-uplatex.dvi ; \
	done

uplatex-cid-haranoaji:
	for opt in default deluxe bold expert dlxexp; do \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-cid-$$opt-h-hara-uplatex.pdf uotf-cid-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-cid-$$opt-v-hara-uplatex.pdf uotf-cid-$$opt-v-uplatex.dvi ; \
	done

uplatex-cid-kozuka:
	for opt in default deluxe expert dlxexp; do \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-cid-$$opt-h-koz-uplatex.pdf uotf-cid-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-cid-$$opt-v-koz-uplatex.pdf uotf-cid-$$opt-v-uplatex.dvi ; \
	done

uplatex-cid-ibmplex:
	for opt in default deluxe dlxexp; do \
		$(DVIPDFMX) -f utfmacro-ibmplex.map -o uotf-cid-$$opt-h-iplx-uplatex.pdf uotf-cid-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-ibmplex.map -o uotf-cid-$$opt-v-iplx-uplatex.pdf uotf-cid-$$opt-v-uplatex.dvi ; \
	done

platex-cid-compile:
	for opt in default deluxe bold expert dlxexp; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotf-cid-h.tex ; \
		mv uotf-cid-h.dvi uotf-cid-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotf-cid-v.tex ; \
		mv uotf-cid-v.dvi uotf-cid-$$opt-v-platex.dvi ; \
	done

platex-cid-haranoaji:
	for opt in default deluxe bold expert dlxexp; do \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-cid-$$opt-h-hara-platex.pdf uotf-cid-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map -o uotf-cid-$$opt-v-hara-platex.pdf uotf-cid-$$opt-v-platex.dvi ; \
	done

platex-cid-kozuka:
	for opt in default deluxe expert dlxexp; do \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-cid-$$opt-h-koz-platex.pdf uotf-cid-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-kozuka.map -o uotf-cid-$$opt-v-koz-platex.pdf uotf-cid-$$opt-v-platex.dvi ; \
	done

platex-cid-ibmplex:
	for opt in default deluxe dlxexp; do \
		$(DVIPDFMX) -f utfmacro-ibmplex.map -o uotf-cid-$$opt-h-iplx-platex.pdf uotf-cid-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-ibmplex.map -o uotf-cid-$$opt-v-iplx-platex.pdf uotf-cid-$$opt-v-platex.dvi ; \
	done

uplatex-article:
	for opt in noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{article}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-a-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-a-uplatex.dvi ; \
	done

platex-article:
	for opt in noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{article}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-a-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-a-platex.dvi ; \
	done

uplatex-brsg:
	for opt in default expert; do \
	for burasage in br oi; do \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{ujbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-h-uplatex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{utbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-v-uplatex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-v-uplatex.dvi ; \
	done \
	done

platex-brsg:
	for opt in default expert; do \
	for burasage in br oi; do \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{jbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-h-platex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{tbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-v-platex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-v-platex.dvi ; \
	done \
	done

uplatex-jis04:
	for opt in default expert; do \
	for brsg in br oi; do \
	for jis in 00 04; do \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$brsg}\def\jisvar{$$jis}\def\class{ujarticle}\input" upjis2004.tex ; \
		mv upjis2004.dvi upjis2004-$$opt-$$brsg-$$jis-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map upjis2004-$$opt-$$brsg-$$jis-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$brsg}\def\jisvar{$$jis}\def\class{utarticle}\input" upjis2004.tex ; \
		mv upjis2004.dvi upjis2004-$$opt-$$brsg-$$jis-v-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map upjis2004-$$opt-$$brsg-$$jis-v-uplatex.dvi ; \
	done \
	done \
	done

platex-jis04:
	for opt in default expert; do \
	for brsg in br oi; do \
	for jis in 00 04; do \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$brsg}\def\jisvar{$$jis}\def\class{jarticle}\input" upjis2004.tex ; \
		mv upjis2004.dvi upjis2004-$$opt-$$brsg-$$jis-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map upjis2004-$$opt-$$brsg-$$jis-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$brsg}\def\jisvar{$$jis}\def\class{tarticle}\input" upjis2004.tex ; \
		mv upjis2004.dvi upjis2004-$$opt-$$brsg-$$jis-v-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map upjis2004-$$opt-$$brsg-$$jis-v-platex.dvi ; \
	done \
	done \
	done

uplatex-scale:
	for scl in default 0.5 1.0 1.5 2.0; do \
		$(UPLATEX) "\def\scale{$$scl}\def\class{ujarticle}\input" otfscale.tex ; \
		mv otfscale.dvi otfscale-$$scl-uplatex.dvi ; \
		$(DVIPDFMX) otfscale-$$scl-uplatex.dvi ; \
	done
	for scl in default 1.0; do \
		$(UPLATEX) "\def\scale{$$scl}\def\class{jsarticle}\input" otfscale.tex ; \
		mv otfscale.dvi otfscale-$$scl-js-uplatex.dvi ; \
		$(DVIPDFMX) otfscale-$$scl-js-uplatex.dvi ; \
	done

platex-scale:
	for scl in default 0.5 1.0 1.5 2.0; do \
		$(PLATEX) "\def\scale{$$scl}\def\class{jarticle}\input" otfscale.tex ; \
		mv otfscale.dvi otfscale-$$scl-platex.dvi ; \
		$(DVIPDFMX) otfscale-$$scl-platex.dvi ; \
	done
	for scl in default 1.0; do \
		$(PLATEX) "\def\scale{$$scl}\def\class{jsarticle}\input" otfscale.tex ; \
		mv otfscale.dvi otfscale-$$scl-js-platex.dvi ; \
		$(DVIPDFMX) otfscale-$$scl-js-platex.dvi ; \
	done

uplatex-prop:
	for test in 1 2; do \
		$(UPLATEX) "\def\class{ujarticle}\input" upkanatest$$test.tex ; \
		mv upkanatest$$test.dvi upkanatest$$test-h-uplatex.dvi ; \
		$(DVIPDFMX) upkanatest$$test-h-uplatex.dvi ; \
		$(UPLATEX) "\def\class{utarticle}\input" upkanatest$$test.tex ; \
		mv upkanatest$$test.dvi upkanatest$$test-v-uplatex.dvi ; \
		$(DVIPDFMX) -l upkanatest$$test-v-uplatex.dvi ; \
	done

platex-prop:
	for test in 1 2; do \
		$(PLATEX) "\def\class{jarticle}\input" upkanatest$$test.tex ; \
		mv upkanatest$$test.dvi upkanatest$$test-h-platex.dvi ; \
		$(DVIPDFMX) upkanatest$$test-h-platex.dvi ; \
		$(PLATEX) "\def\class{tarticle}\input" upkanatest$$test.tex ; \
		mv upkanatest$$test.dvi upkanatest$$test-v-platex.dvi ; \
		$(DVIPDFMX) -l upkanatest$$test-v-platex.dvi ; \
	done

punct:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\input" punctuation.tex ; \
		mv punctuation.dvi punctuation-$$opt.dvi ; \
		$(DVIPDFMX) punctuation-$$opt.dvi ; \
	done

uplatex-exclam:
	for opt in default deluxe noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\input" exclam.tex ; \
		mv exclam.dvi exclam-$$opt-uplatex.dvi ; \
		$(DVIPDFMX) exclam-$$opt-uplatex.dvi ; \
	done

platex-exclam:
	for opt in default deluxe noreplace; do \
		$(PLATEX) "\def\option{$$opt}\input" exclam.tex ; \
		mv exclam.dvi exclam-$$opt-platex.dvi ; \
		$(DVIPDFMX) exclam-$$opt-platex.dvi ; \
	done

uplatex-utfmacro:
	for opt in default deluxe bold; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" utfmacro-cjk.tex ; \
		mv utfmacro-cjk.dvi utfmacro-cjk-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map utfmacro-cjk-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" utfmacro-cjk.tex ; \
		mv utfmacro-cjk.dvi utfmacro-cjk-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) -l -f utfmacro-haranoaji.map utfmacro-cjk-$$opt-v-uplatex.dvi ; \
	done

platex-utfmacro:
	for opt in default deluxe bold; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" utfmacro-cjk.tex ; \
		mv utfmacro-cjk.dvi utfmacro-cjk-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map utfmacro-cjk-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" utfmacro-cjk.tex ; \
		mv utfmacro-cjk.dvi utfmacro-cjk-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) -l -f utfmacro-haranoaji.map utfmacro-cjk-$$opt-v-platex.dvi ; \
	done

mltwght:
	$(UPLATEX) "\def\map{mapline}\input" cjk-mltwght-h.tex ; \
	mv cjk-mltwght-h.dvi cjk-mltwght-h-line.dvi ; \
	$(DVIPDFMX)    cjk-mltwght-h-line.dvi ; \
	$(UPLATEX) "\def\map{mapline}\input" cjk-mltwght-v.tex ; \
	mv cjk-mltwght-v.dvi cjk-mltwght-v-line.dvi ; \
	$(DVIPDFMX) -l cjk-mltwght-v-line.dvi ; \
	$(UPLATEX) cjk-mltwght-h.tex ; \
	mv cjk-mltwght-h.dvi cjk-mltwght-h-cmap.dvi ; \
	$(DVIPDFMX)    -f utfmacro-haranoaji.map cjk-mltwght-h-cmap.dvi ; \
	$(UPLATEX) cjk-mltwght-v.tex ; \
	mv cjk-mltwght-v.dvi cjk-mltwght-v-cmap.dvi ; \
	$(DVIPDFMX) -l -f utfmacro-haranoaji.map cjk-mltwght-v-cmap.dvi ; \
	$(UPLATEX) cjk-pxbabel-h.tex ; \
	$(DVIPDFMX)    -f utfmacro-haranoaji.map cjk-pxbabel-h.dvi ; \
	$(UPLATEX) cjk-pxbabel-v.tex ; \
	$(DVIPDFMX) -l -f utfmacro-haranoaji.map cjk-pxbabel-v.dvi

uplatex-dir:
	for opt in default expert noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" direction-utf8.tex ; \
		mv direction-utf8.dvi direction-$$opt-uplatex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map direction-$$opt-uplatex.dvi ; \
		$(DVIPS) -u jotf-psfonts.map direction-$$opt-uplatex.dvi ; \
	done

platex-dir:
	for opt in default expert noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" direction-utf8.tex ; \
		mv direction-utf8.dvi direction-$$opt-platex.dvi ; \
		$(DVIPDFMX) -f utfmacro-haranoaji.map direction-$$opt-platex.dvi ; \
		$(DVIPS) -u jotf-psfonts.map direction-$$opt-platex.dvi ; \
	done

clean:
	rm -f *.aux *.log *.dvi *.pdf
