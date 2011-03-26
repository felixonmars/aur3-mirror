# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=qpixman
pkgver=0.13.3
pkgrel=1
pkgdesc="Modified pixman for SPICE"
arch=('i686' 'x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=('glibc')
makedepends=('rpmextract')
install=
_tarballname=$pkgname-$pkgver-git20090127
source=(ftp://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/$pkgname-$pkgver-4.el5.src.rpm)
noextract=()
md5sums=('fcc56cfcd808c8892e39613c1d8db9c5')

build() {
  cd $srcdir
  rpmextract.sh $pkgname-$pkgver-4.el5.src.rpm
  tar xzf qpixman-0.13.3-git20090127.tar.gz
  cd "$srcdir/qpixman-0.13.3-git20090127"

  ./configure --disable-static -includedir=/usr/include --libdir=/usr/lib
  patch -p1 -i ../fix-raster-ops.patch
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('95f4edcf418984327330c2cd39297896')
md5sums=('46944eb05639461b5db47c17dbcd3fdc')
