UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex -kanji=utf8
DVIPS = dvips
DVIPDFMX = dvipdfmx -v
PDVITYPE = pdvitype

all: otf sp art brsg jis04 scale prop punct exclam

otf: uplatex-otf platex-otf
sp: uplatex-sp platex-sp
art: uplatex-article platex-article
brsg: uplatex-brsg platex-brsg
jis04: uplatex-jis04 platex-jis04
scale: uplatex-scale platex-scale
prop: uplatex-prop platex-prop
exclam: uplatex-exclam platex-exclam
utfmacro: uplatex-utfmacro platex-utfmacro

uplatex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-uplatex.dvi ; \
	done

platex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-platex.dvi ; \
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

clean:
	rm -f *.aux *.log *.dvi *.pdf
