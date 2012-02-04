# Maintainer: eric <eric@archlinux.org>
# Contributor: Sarah Hay <sarah31@sarah31.ca>

pkgname=siag-office
pkgver=3.6.1
pkgrel=5
pkgdesc="Siag Office is a tightly integrated, free office package"
arch=('i686' 'x86_64')
url="http://siag.nu/index.shtml"
license=("GPL")
options=('docs')
depends=('mowitz' 'libxpm' 'nextaw')
source=(http://siag.nu/pub/siag/siag-3.6.1.tar.gz Makefile.patch kdeinst.patch)

build() {
  cd $startdir/src/siag-$pkgver
  ./configure --prefix=/usr --with-xawm=neXtaw \
    --with-docdir=/usr/share/doc/siag
  patch -p1 < ../Makefile.patch
  patch -p1 < ../kdeinst.patch 
  make 
  make KDEDIR=$pkgdir/opt/kde DESTDIR=$pkgdir install
}
md5sums=('3d00dda22209327bb907ba78850c797f'
         '1583eff25833d153558a844a0d63b329'
         '59e395c2c9b87963795bba6284b31353')
