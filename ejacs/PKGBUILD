# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ejacs
pkgver=20081127
pkgrel=2
pkgdesc="JavaScript/ECMAScript console for emacs"
arch=("i686" "x86_64")
url="http://code.google.com/p/ejacs/"
depends=("emacs")
makedepends=("emacs")
source=("http://ejacs.googlecode.com/files/ejacs-11-27-08.zip")
md5sums=('d11f34f7a686f6e4d8977e94698fec8c')
license=("GPL")

build() {
  cd $srcdir
  emacs -batch -q -L . -f batch-byte-compile *.el
}

package() {
  cd $srcdir
  for f in *.el{,c} README; do
    install -Dm 644 $f ${pkgdir}/usr/share/emacs/site-lisp/ejacs/$f
  done
}
