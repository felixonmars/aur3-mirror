# Maintainer: TDY <tdy@archlinux.info>

pkgname=openshmem
pkgver=1.0d
pkgrel=1
pkgdesc="A reference implementation and specification for PGAS parallel programming"
arch=('i686' 'x86_64')
url="http://openshmem.org/"
license=('BSD')
depends=('elfutils' 'gasnet')
options=('!emptydirs')
source=(http://bongo.cs.uh.edu/site/sites/default/site_files/$pkgname-release-$pkgver.tar.bz2)
md5sums=('0a2758de19b24d18435c6b849f4ae9cd')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  ./configure --prefix=/usr \
    --with-libelf-libs=/usr/lib \
    --with-gasnet-root=/usr \
    --with-gasnet-conduit=smp \
    --with-modulesdir="\$(PREFIX)/lib" \
    --with-modulefilesdir="\$(PREFIX)/share/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make install \
    PREFIX="$pkgdir/usr/" \
    MODDIR="$pkgdir/usr/lib/$pkgname"
  install -Dm644 ACKNOWLEDGEMENT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
