#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#

pkgname=pacget-git
pkgver=20120922
pkgrel=1
pkgdesc="Download PKGBUILD's from Arch Linux Package Management (ALPM) database."
arch=(any)
url="https://github.com/drizzd/pacget"
license=('GPL')
depends=('expac' 'rsync' 'jshon' 'curl')
# Remove this and the install command for aurget below if you want to use
# pacget and the aurget package.
conflicts=('aurget')
makedepends=('git')

_gitroot="https://github.com/drizzd/pacget.git"
_gitname="pacget"

build() {
  cd "$srcdir"

  msg "Connecting to the GIT server..."
  if test -d "${_gitname}"
  then
    cd "${_gitname}"
    git pull --ff-only origin
    msg "The local files are updated..."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi
  msg "GIT checkout done."
}

package() {
  install -D -m755 "$srcdir/pacget/pacget" "$pkgdir/usr/bin/pacget"
  install -D -m755 "$srcdir/pacget/aurget" "$pkgdir/usr/bin/aurget"
  install -D -m755 "$srcdir/pacget/aurlist" "$pkgdir/usr/bin/aurlist"
}
