# adapted from MAKEjapaneseotf subroutine from
# ctan2tds 2018-01-16 r46332 status.
# see Master/tlpkg/libexec/ctan2tds

TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)
PWDF = $(shell pwd)

default:
	cd $(PWDF)/japanese-otf ; sh ./makeotf
	cd $(PWDF)/japanese-otf-uptex ; \
	sh ./umakeotf ; \
	sh ./umakeotf_prop ; \
	sh ./umakeotf_brsg ; \
	sh ./umakeotf_jis04

.PHONY: install
install:
	## install TEXMF/fonts/* and TEXMF/source/fonts/*
	# fontmap.zip is not installed, nor extracted
	# as it contains files with parenthesis
	for PKGNAME in japanese-otf japanese-otf-uptex ; do \
		for i in vf tfm ofm ; do \
			if [ -d $$PKGNAME/$$i ]; then \
				mkdir -p ${TEXMF}/fonts/$$i/public/$$PKGNAME ; \
				cp $$PKGNAME/$$i/* ${TEXMF}/fonts/$$i/public/$$PKGNAME/ ; \
			fi ; \
		done ; \
		if [ -d $$PKGNAME/TeXLive-maps ]; then \
			mkdir -p ${TEXMF}/fonts/map/dvipdfmx/$$PKGNAME ; \
			cp $$PKGNAME/TeXLive-maps/* ${TEXMF}/fonts/map/dvipdfmx/$$PKGNAME/ ; \
		fi ; \
		for i in basepl script patch ; do \
			if [ -d $$PKGNAME/$$i ]; then \
				mkdir -p ${TEXMF}/source/fonts/$$PKGNAME ; \
				cp $$PKGNAME/$$i/* ${TEXMF}/source/fonts/$$PKGNAME/ ; \
			fi ; \
		done ; \
		cp $$PKGNAME/*mkjvf ${TEXMF}/source/fonts/$$PKGNAME/ ; \
		cp $$PKGNAME/*makeotf* ${TEXMF}/source/fonts/$$PKGNAME/ ; \
	done
	## install TEXMF/tex/*
	# if we are installing "japanese-otf" package, remove these two
	# style files, as they are overriden by the files in "japanese-otf-uptex"
	if [ -d japanese-otf/sty ]; then \
		mkdir -p ${TEXMF}/tex/platex/japanese-otf ; \
		ls japanese-otf/sty/* | grep -v otf\\.sty | grep -v mlutf\\.sty \
		| xargs -I % cp % ${TEXMF}/tex/platex/japanese-otf/ ; \
	fi
	if [ -d japanese-otf-uptex/sty ]; then \
		mkdir -p ${TEXMF}/tex/platex/japanese-otf-uptex ; \
		cp japanese-otf-uptex/sty/* ${TEXMF}/tex/platex/japanese-otf-uptex/ ; \
	fi
	for PKGNAME in japanese-otf japanese-otf-uptex ; do \
		mkdir -p ${TEXMF}/doc/fonts/$$PKGNAME ; \
		cp $$PKGNAME/COPYRIGHT ${TEXMF}/doc/fonts/$$PKGNAME/ ; \
		cp $$PKGNAME/README ${TEXMF}/doc/fonts/$$PKGNAME/ ; \
		cp $$PKGNAME/*.txt ${TEXMF}/doc/fonts/$$PKGNAME/ ; \
	done
