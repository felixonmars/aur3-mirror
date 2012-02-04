# Maintainer : Bai Wensimi<baiwensimi@gmail.com>

pkgname=xecjk-svn
pkgver=273
pkgrel=1
pkgdesc="XeTeX macro for typesetting mixed Chinese documents with punctuation spacing adjustment and prohibitions"
arch=(any)
url="http://code.google.com/p/ctex-kit"
depends=('texlive-bin>=2009')
license=('new BSD License')
source=()
_svntrunk=http://ctex-kit.googlecode.com/svn/trunk/xecjk
_svnmod=xecjk
install=(xecjk.install)
md5sums=()

build(){
	cd ${srcdir}
	
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

	mkdir -p $pkgdir/usr/share/texmf/tex/xelatex/xecjk/
	mkdir -p $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	mkdir -p $pkgdir/usr/share/texmf/doc/xelatex/xecjk/examples/
	cd $_svnmod
	install -m 644 ./source/xelatex/xecjk/xeCJK.dtx $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	install -m 644 ./source/xelatex/xecjk/xeCJK.ins $pkgdir/usr/share/texmf/source/xelatex/xecjk/
	install -m 644 ./doc/xelatex/xecjk/xeCJK.pdf $pkgdir/usr/share/texmf/doc/xelatex/xecjk/
	install -m 644 ./doc/xelatex/xecjk/examples/*.tex $pkgdir/usr/share/texmf/doc/xelatex/xecjk/examples/
	install -m 644 ./tex/xelatex/xecjk/xeCJK.sty $pkgdir/usr/share/texmf/tex/xelatex/xecjk/
}


