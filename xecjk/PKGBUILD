# Maintainer : Weng Xuetian <hurricanek@126.com>

pkgname=xecjk
pkgver=2.3.15
pkgrel=1
pkgdesc="XeTeX macro for typesetting mixed Chinese documents with punctuation spacing adjustment and prohibitions"
arch=(any)
url="http://code.google.com/p/ctex-kit"
depends=('texlive-bin>=2009')
source=(http://saber-personal-project.googlecode.com/files/$pkgname-$pkgver.zip)
license=('new BSD License')
install=(xecjk.install)

build()
{
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/texmf/tex/xelatex/xecjk/
	mkdir -p $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	mkdir -p $pkgdir/usr/share/texmf/doc/xelatex/xecjk/examples/
	install -m 644 ./source/xelatex/xecjk/xeCJK.dtx $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	install -m 644 ./source/xelatex/xecjk/xeCJK.ins $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	install -m 644 ./doc/xelatex/xecjk/xeCJK.pdf $pkgdir/usr/share/texmf/doc/xelatex/xecjk/
	install -m 644 ./doc/xelatex/xecjk/examples/*.tex $pkgdir/usr/share/texmf/doc/xelatex/xecjk/examples/
	install -m 644 ./tex/xelatex/xecjk/xeCJK.sty $pkgdir/usr/share/texmf/tex/xelatex/xecjk/
}

md5sums=('a81c8812a31a6cae5900dd8251f2c508')
