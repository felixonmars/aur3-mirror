# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=pandora-misc-git
_pkgname=pandora-misc
pkgver=20130509
pkgrel=1
pkgdesc="Misc collection of functions and tools to make working Pandora-specific operations easier."
url="http://openpandora.org/"
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
depends=('fbset' tslib-git)
makedepends=('git')
options=('!buildflags')

_gitroot="git://git.openpandora.org/pandora-misc.git"
_gitname="pandora-misc"


build() {
  msg "Connecting to GIT server...."

  cd "$srcdir"
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  make CROSS_COMPILE='' all ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_gitname"
  make INSTALL="$pkgdir/usr/bin" install ${MAKEFLAGS}
  cd "$pkgdir"
}
