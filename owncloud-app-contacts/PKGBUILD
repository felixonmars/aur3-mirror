# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-contacts
epoch=1
pkgver=v0.4.0.0.r70.g7246bf3
pkgrel=1
pkgdesc="Contacts app for owncloud (Fix for double-encoding bug)"
arch=('any')
url="https://github.com/owncloud/contacts/pull/1003"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-contacts')
provides=('owncloud-app-contacts')
source=("git+https://github.com/untitaker/contacts.git")
md5sums=('SKIP')

pkgver() {
  cd contacts
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/contacts ${pkgdir}/usr/share/webapps/owncloud/apps/contacts
}
