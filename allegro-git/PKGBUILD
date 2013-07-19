# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: arjan <arjan@archlinux.org>

pkgname=allegro-git
_gitname=allegro
pkgver=5.1.7.81.g1824b1b
pkgrel=1
pkgdesc="A portable library mainly aimed at video game and multimedia programming."
arch=('x86_64' 'i686')
url="http://alleg.sourceforge.net/"
license=('custom:ZLIB')
depends=('jack' 'libxpm' 'libxxf86dga' 'libgl' 'physfs' 'gtk2' 'openal' 'ffmpeg')
makedepends=('cmake' 'glu' 'git')
optdepends=('pandoc: for making the documentation')
provides=('allegro')
conflicts=('allegro')
source=('git://git.code.sf.net/p/alleg/allegro')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DWANT_DOCS=ON \
    -DWANT_DOCS_MAN=OFF \
    -DWANT_PHYSFS=ON
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/"
  install -d "$pkgdir/opt/$pkgname"
  cp -rf docs/html "$pkgdir/usr/share/doc/$pkgname"
  cp -rf examples/data examples/ex_* "$pkgdir/opt/$pkgname"

  install -Dm644 "LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
