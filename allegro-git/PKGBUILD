# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: arjan <arjan@archlinux.org>

pkgname=allegro-git
pkgver=20120703
pkgrel=1
pkgdesc="Portable library mainly aimed at video game and multimedia programming"
arch=('x86_64' 'i686')
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('jack' 'libxpm' 'libxxf86dga' 'libgl' 'physfs' 'gtk2' 'libpulse')
makedepends=('cmake' 'mesa' 'git')
provides=('allegro')
conflicts=('allegro')

_gitroot="git://alleg.git.sourceforge.net/gitroot/alleg/allegro"
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

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_DOCS=OFF \
    -DWANT_PHYSFS=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
