# Contributor: Will Tipton <wtipton@hmc.edu>
pkgname=hlatex
_pkgname=HLaTeX
pkgver=1.0.1
pkgrel="1" 
install=hlatex.install
pkgdesc="Allows one to run latex on a Korean KS X 1001 encoded document or run lambda on a Korean latex document encoded in UTF-8."
depends=('tetex' 'hlatex-fonts')
source=(ftp://ftp.sunsite.utk.edu/pub/CTAN/language/korean/$_pkgname.zip)
url="http://project.ktug.or.kr/hlatex/"
md5sums=('659dd771bb6093546d5b212f6f3214db')

build() {
	cd $startdir/src/$_pkgname/
	TEXMF=$startdir/pkg/usr/share/texmf

	mkdir -p $TEXMF/tex/latex/hlatex
	cp latex/{hangul.sty,hfont.tex,euc-kr.tex,hfont.sty,josa.tab} latex/hsw*.fd latex/hww*.fd latex/hhw*.fd $TEXMF/tex/latex/hlatex/

	mkdir -p $TEXMF/tex/lambda/hlatex
	cp lambda/{u8hangul.tex,uhc-test.tex} lambda/uhc*.fd $TEXMF/tex/lambda/hlatex

	mkdir -p $TEXMF/omega/otp/hlatex
	cp lambda/hlatex.otp $TEXMF/omega/otp/hlatex/

	mkdir -p $TEXMF/omega/ocp/hlatex
	cp lambda/hlatex.ocp $TEXMF/omega/ocp/hlatex/

	mkdir -p $TEXMF/tex/latex/hlatex
	cp contrib/{hbname-k.tex,khyper.sty,showhkeys.sty,showhtags.sty,hangulfn.sty,hfn-k.tex} $TEXMF/tex/latex/hlatex

	mkdir -p $TEXMF/tex/lambda/hlatex
	cp contrib/{hbname-u.tex,hfn-u.tex} $TEXMF/tex/lambda/hlatex

	mkdir -p $TEXMF/bibtex/bst/hlatex
	cp contrib/halpha.bst $TEXMF/bibtex/bst/hlatex/

	mkdir -p $TEXMF/makeindex
	cp contrib/{hind.ist,hglo.ist} $TEXMF/makeindex/

	cd contrib
	gcc -o hmakeindex hmakeindex.c
	gcc -o hbibtex hbibtex.c
	mkdir -p $startdir/pkg/usr/bin
	install -m 755 hmakeindex $startdir/pkg/usr/bin/
	install -m 755 hbibtex $startdir/pkg/usr/bin/
}
