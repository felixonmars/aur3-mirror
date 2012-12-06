# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: arjan <arjan@archlinux.org>

pkgname=allegro-git
pkgver=20121206
pkgrel=1
pkgdesc="Portable library mainly aimed at video game and multimedia programming"
arch=('x86_64' 'i686')
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('jack' 'libxpm' 'libxxf86dga' 'physfs' 'gtk2' 'openal' 'nvidia-cg-toolkit' 'ffmpeg' 'glu')
makedepends=('cmake' 'mesa' 'git')
optdepends=('pandoc: for making the documentation')
provides=('allegro')
conflicts=('allegro')

_gitroot="git://git.code.sf.net/p/alleg/allegro"
_gitname="allegro"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_DOCS=ON \
    -DWANT_DOCS_MAN=OFF \
    -DWANT_PHYSFS=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/"
  install -d "$pkgdir/opt/$pkgname/examples"
  cp -r docs/html "$pkgdir/usr/share/doc/$pkgname"
  cp -rf examples/data examples/ex_* "$pkgdir/opt/$pkgname/examples"

  cd ..
  install -Dm644 "LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
