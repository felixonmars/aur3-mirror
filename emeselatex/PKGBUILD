pkgname=emeselatex
pkgver=0.1
pkgrel=1
pkgdesc="It converts LaTeX math syntax into an emoticon, so you can use this plugin to chat with every client and every OS."
url="http://dainaccio.wordpress.com/2008/07/28/emeselatex/"
arch=('i686' 'x86_64')
license=()
makedepends=()
depends=('texlive-latex3' 'libpng' 'emesene')
optdepends=()
provides=('emeselatex')
source=(http://italianmafia.altervista.org/blog/download.php?get=emeseLaTeX.py)

md5sums=('eca7931b7fe36f2ebe68693c53bd78f2')


build() {
  _destdir=/usr/share/emesene/plugins_base
  mkdir -p $pkgdir$_destdir
  cd $srcdir
  cd ..
  cp download.php?get=emeseLaTeX.py $pkgdir$_destdir/emeseLaTeX.py
}

