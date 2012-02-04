# Contributor: Andrei Thorp <garoth at the fanciful gmail dot com>
pkgname=xcb-ewmh
pkgver=20100212
pkgrel=1
# Yes, I know it's the git version and it should have -git. However, this is
# the _only_ version of xcb-util with ewmh available -- and it will probably
# be merged into xcb-util proper one day.
pkgdesc="xcb-util branch with the ewmh specification extension (git)"
arch=('i686' 'x86_64')
url="git://people.freedesktop.org/~arnau"
license=('custom')
depends=('libxcb>=1.4')
makedepends=('gperf' 'git')
conflicts=(xcb-util)
provides=(xcb-util)
source=(LICENSE)
md5sums=('2672c2e72dedb40f773e989dd622f298')

_gitroot="--branch xcb-ewmh git://people.freedesktop.org/~arnau/xcb-util.git"
_gitname="xcb-util"

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
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
  # Is this the right way to make sure libtool files don't get here? Tell me if it's not.
  rm ${pkgdir}/usr/lib/*.la
}
