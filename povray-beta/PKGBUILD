# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=povray-beta
pkgver=3.7.0.RC3
pkgrel=1
pkgdesc="A script based raytracer for high-quality three-dimensional graphics"
arch=('i686' 'x86_64')
url="http://povray.org/"
license=('custom')
depends=('boost-libs' 'libpng' 'libtiff' 'sdl')
makedepends=('boost' 'openexr')
provides=('povray')
conflicts=('povray')
backup=('etc/povray/3.7/povray.conf' 'etc/povray/3.7/povray.ini')
source=(http://www.povray.org/beta/source/povray-$pkgver.tar.bz2 \
        no_user_install.diff \
        NOTICE)
md5sums=('66480f1ca6b1b1b5198605b6caf3f8e8'
         '487d7bf4d99952b18f84188fd6483ad1'
         'd496f86ba83747a7caa363be8c5631eb')

build() {
  cd "$srcdir"/povray-$pkgver

  sed -i 's|/usr/local|/usr|' vfe/unix/unixoptions.h
  patch -Np1 < "$srcdir"/no_user_install.diff || true

  [ "$PACKAGER" ] && COMPILED="$PACKAGER" || COMPILED="John Doe"
  ./configure COMPILED_BY="$COMPILED" --prefix=/usr --sysconfdir=/etc \
    --with-openexr=/usr/

  make
}

package() {
  cd "$srcdir"/povray-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
#  install -m644 doc/povlegal.doc "$pkgdir"/usr/share/licenses/$pkgname/
#  install -m644 doc/source-license.txt "$pkgdir"/usr/share/licenses/$pkgname/
#  install -m644 doc/distribution-license.txt "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 "$srcdir"/NOTICE "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
