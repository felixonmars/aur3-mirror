# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# reference http://www.dreyou.org/ovirt/ovirt-engine/Packages/
# http://resources.ovirt.org/releases/stable/rpm/Fedora/19/x86_64/

pkgname=ovirt-engine-git
pkgver=ffb5fb0
pkgrel=1
pkgdesc="Management server for Open Virtualization"
arch=(any)
url="http://ovirt.org"
license=('apache2')
makedepends=('git')
source=('git+git://gerrit.ovirt.org/ovirt-engine')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR=$pkgdir install
}
