# Contributor: Julien <paci79@free.fr>

pkgname=clictap
pkgver=0.6
pkgrel=2
pkgdesc="Clictap is a small program written in C which allows you to use your mouse as a remote control unit"
arch=('i686' 'x86_64')
conflicts=('')
depends=('libxtst')
license=('GPL')
makedepends=('')
source=(http://clictap.positon.org/pages/download/_fichiers/clictap_$pkgver.tar.gz)
url="http://clictap.positon.org/"

md5sums=('2f7ad8c891ab3fb792d1acbe4d0f31ad')

build() {

  cd ${startdir}/src/clictap

  rm clictap
  make || return 1
  install -d $startdir/pkg/usr/bin/
  install -d $startdir/pkg/etc
  install -d $startdir/pkg/usr/share/licenses/clictap/
  install $startdir/src/$pkgname/clictap $startdir/pkg/usr/bin/clictap
  install $startdir/src/$pkgname/clictap.example.conf $startdir/pkg/etc/clictap.example.conf
  install $startdir/src/$pkgname/LICENSE $startdir/pkg/usr/share/licenses/clictap/LICENSE
}
