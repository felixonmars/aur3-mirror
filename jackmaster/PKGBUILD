# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jackmaster
pkgver=0.0.2
pkgrel=1
pkgdesc="A mixer and a master console for JACK."
arch=(i686 x86_64)
url="http://69b.org/cms/software/jackmaster"
license=('GPL')
depends=('jack' 'gtk' 'lash')
makedepends=('p7zip' 'cpio')
options=('!libtool')
source=("http://69b.org/web69/dl/$pkgname-$pkgver.cpio.7z")
md5sums=('742bd8723907d6a2270655b645a28410')

build() {
  7z x -so "$srcdir/${source[0]/*\/}" | cpio -id
  cd "$srcdir/$pkgname-$pkgver"

  # remove cpu specific flags
  sed -i "/^STD_OPT_CFLAGS/d" configure.in

  # lib install dir fix
  sed -i "/^jacklibdir/s/\$(DESTDIR)//" src/Makefile.in

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
