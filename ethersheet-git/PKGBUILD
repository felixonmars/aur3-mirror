# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# ToDo:
# - bin file
# - systemd service

pkgname=ethersheet-git
_pkgname=EtherSheet
pkgver=v0.0.5.176.g4580553
pkgrel=1
pkgdesc="Ether Sheet is a collaborative, realtime open source spreadsheet"
arch=(any)
url="http://ethersheet.org"
license=('GPL')
depends=('nodejs')
makedepends=('git')
source=('git+https://github.com/ethersheet-collective/EtherSheet.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/${_pkgname}"
  ./bin/install.sh
}

package() {
  cd "$srcdir/${_pkgname}"
  msg "Work in progress!"
}
