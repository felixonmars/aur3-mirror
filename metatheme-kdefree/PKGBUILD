# Contributor: Todd Harbour <lefallen@quadronyx.com.au>
# Comments:
# Just the PKGBUILD by damir <damir@archlinux.org>, but without KDE support
# Pre-built binary package available here: http://www.quadronyx.com.au/aur/

pkgname=metatheme-kdefree
_pkgname=metatheme
pkgver=0.0.6
pkgrel=2
pkgdesc="a thin layer between QT+GTK2 toolkits and theme engines, creating unified API by which each theme engine can draw. Non-KDE version."
url="http://metatheme.advel.cz/"
license="gpl"
depends=( \
	'qt' \
	'gtk2' \
	)
makedepends=('j2sdk')
conflicts=('metatheme')
provides=('metatheme')
source=( \
	$url/download/$_pkgname-$pkgver.tar.bz2 \
	$pkgname.install \
	nolafiles.patch \
	)

md5sums=( \
	'f66ae2414001b18c5e4d17e4ba9ef353' \
	'08c0e41b6e9972c58b0ee8987e1780dc' \
	'7ab8b8b9842884549305675f5cdcf55a' \
	)

install=$pkgname.install

build() {
  cd $startdir/src/$_pkgname-$pkgver
  patch < $startdir/nolafiles.patch
  ./configure --without-kde --enable-qt --prefix=/usr
  make || return 1
  sed -i '543,545s/^/# /' toolkits/java/Makefile # disable broken swing default metatheme config (arch is not having a swing.properties file per default)
  make DESTDIR=$startdir/pkg install || return 1
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
