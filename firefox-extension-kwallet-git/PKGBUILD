# Maintainer:Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=firefox-extension-kwallet-git
pkgver=1.14.2.ga7c67a0
pkgrel=1
pkgdesc="An extension to allows Firefox to use KDE's Kwallet to store passwords"
arch=('i686' 'x86_64')
url="https://github.com/maciex/mozilla-kwallet"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')
depends=('qt4' 'kdelibs' 'firefox' 'kdeutils-kwalletmanager')
makedepends=('git' 'cmake' 'automoc4')
source=('git://github.com/maciex/mozilla-kwallet.git')
md5sums=('SKIP')

pkgver() {
  cd mozilla-kwallet
  echo $(grep -Po ':version>\K[^<]*' xpi/install.rdf).g$(git describe --always)
}

package() {
  cd mozilla-kwallet/xpi

  # Variables
  emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid

  # Install
  sed -i "s|<em:maxVersion>.*</em:maxVersion>|<em:maxVersion>99.*</em:maxVersion>|" install.rdf
  install -dm755 "$dstdir"
  cp -r * "$dstdir/"
}
