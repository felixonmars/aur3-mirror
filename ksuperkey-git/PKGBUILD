# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=ksuperkey-git
_pkgname=ksuperkey
pkgver=v0.1.r54.ge75a31a
pkgrel=1
pkgdesc="Allows you to open the application launcher in KDE Plasma4 using the Super(Windows) key"
url=("https://github.com/hanschen/ksuperkey")
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libxtst')
makedepends=('git')
source=("$_pkgname"::'git://github.com/hanschen/ksuperkey.git')
provides=('ksuperkey')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: