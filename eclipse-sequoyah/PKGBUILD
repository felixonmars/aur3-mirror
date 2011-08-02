# Contributor: David Reepmeyer <djreep81@gmail.com>

pkgname=eclipse-sequoyah
pkgver=2.0
_pkgbuild=2.0.0.I20110609-0753
pkgrel=1
pkgdesc="Sequoyah project's purpose is to be focused on the needs of all mobile developers. Inheriting components from TmL, MTJ and Pulsar projects, Sequoyah intends to remove the artificial barriers of Linux and Java in order to provide a home for all Eclipse mobile developers"
url="http://www.eclipse.org/sequoyah/"
arch=('any')
license=('EPL')
depends=('eclipse' 'java-runtime>=5')
optdepends=("java-environment>=5")
makedepends=('unzip')
changelog=$pkgname.changelog
source=("http://download.eclipse.org/sequoyah/downloads/drops/$pkgver/$_pkgbuild/org.eclipse.sequoyah.feature.$_pkgbuild.zip")
md5sums=('9e25138cc9648fdcdddb8296bcfc8807')
sha256sums=('b60da437d730a573884e20edad899b8a2ea8bbd53aa7b544f4c9d1eeeb9fe1e3')

package() {
  cd $srcdir || return 1
  find * -type f | while read file; do
    install -Dm644 "$file" "$pkgdir/usr/share/eclipse/dropins/eclipse-sequoyah/eclipse/$file" || return 1
  done || return 1
}

