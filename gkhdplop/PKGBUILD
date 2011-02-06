# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=gkhdplop
_pkgname=wmhdplop
pkgver=0.9.9
pkgrel=1
pkgdesc="GKrellM hard-drive read/write visual monitor"
arch=('i686')
url="http://hules.free.fr/wmhdplop/"
license="GPL"
depends=('libsm' 'gkrellm' 'imlib2' 'pkgconfig')
source=(http://hules.free.fr/wmhdplop/$_pkgname-$pkgver.tar.gz)
md5sums=('a64337205bc30faa45053965cc957b0e')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1

  # Preventing wmhdplop installation
  # make DESTDIR=$startdir/pkg install

  # Instead installing gkrellm plugin
  install -D -m755 gkhdplop.so \
  $startdir/pkg/usr/lib/gkrellm2/plugins/gkhdplop.so
}
