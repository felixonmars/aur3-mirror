pkgname=gfarm2fs-fuse
_realname=gfarm2fs
pkgver=1.0.0
pkgrel=1
pkgdesc="GfarmFS-FUSE enables you to mount a Gfarm filesystem in userspace via FUSE mechanism."
url="http://datafarm.apgrid.org/"
depends=('gzip' 'gfarm2' 'fuse')
makedepends=('gcc' 'fuse')
arch=('i686')
license=('BSD')
source=(http://switch.dl.sourceforge.net/sourceforge/gfarm/$_realname-$pkgver.tar.gz)
md5sums=('')

build() {
  cd $startdir/src/$_realname-$pkgver

  ./configure  --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
