msg "Determining latest snapshot of alsa-driver..."
_snapshot=$(curl -s http://www.alsa-project.org/snapshot/files/ \
	| grep -E -o \<a[^\>]*\>alsa-driver.*$ \
	| sed 's#<a[^>]*>\([^<]*\).*#\1#' \
	| tail -n 1)

pkgname=snd-aloop
_pkgname=alsa-driver
pkgver=1.0.23
_pkgver=${_snapshot#alsa-driver-*}
pkgrel=1
pkgdesc="Kernel module for snd-aloop"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
depends=('kernel26')
license=('GPL')
source=("http://www.alsa-project.org/snapshot/files/${_snapshot}")

build() {
  cd ${_pkgname}-${_pkgver}
  ./configure --with-cards=aloop
  make || return 1
  make DESTDIR=$pkgdir install

  rm -fr $pkgdir/usr
  rm -fr $pkgdir/lib/modules/2.6.35-ARCH/kernel/sound/acore
}
md5sums=('d02b668cf9f98096267636c7051761db')
