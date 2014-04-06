# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=opencity
pkgver=0.0.6.4
pkgrel=2
pkgdesc='A full 3D city simulator game project'
arch=('i686' 'x86_64')
url='http://opencity.info'
license=('GPL')
depends=('mesa' 'glu' 'sdl_image' 'sdl_mixer' 'sdl_net')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver}stable.tar.bz2"
        texture.png
        desktop-entry.patch)
md5sums=('7c55cab349800a477afc2bfd692f5495'
         'd2983e6b2674ee99bb631a7e383c781f'
         '2e299a32f8a1543115e8655f4e459eb5')

prepare() {
  cd "$srcdir/$pkgname-${pkgver}stable"

  patch -Np1 -i "$srcdir"/desktop-entry.patch
  cp "$srcdir/texture.png" graphism/electricity/nuclear/texture.png
}

build() {
  cd "$srcdir"/$pkgname-${pkgver}stable

  ./configure --prefix=/usr --sysconfdir=/etc CXXFLAGS=-DHAVE_STDINT_H
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver}stable"

  make DESTDIR="$pkgdir" install
}
