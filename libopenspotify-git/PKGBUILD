# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=libopenspotify-git
pkgver=20100209
pkgrel=1
pkgdesc="An opensource, API-compliant re-implemention of libspotify"
arch=(i686 x86_64)
url="http://github.com/noahwilliamsson/openspotify"
license=('BSD')
depends=('libvorbis' 'openssl')
makedepends=('git')
provides=('libspotify')
conflicts=('libspotify')
source=()

_gitroot="git://github.com/noahwilliamsson/openspotify.git"
_gitname="openspotify"

build() {
  # Git stuff
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # License
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt || return 1

  # Build the lib
  cd libopenspotify
  make || return 1
  make DESTDIR="$pkgdir" prefix="/usr" install
} 
