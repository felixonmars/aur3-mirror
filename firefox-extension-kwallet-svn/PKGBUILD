# Maintainer: Joris Steyn <jorissteyn@gmail.com>

pkgname=firefox-extension-kwallet-svn
_svnname=firefox-kde-wallet-2
pkgver=2.3.32
pkgrel=2
pkgdesc="This is an extension that allows firefox use kde's kwallet password manager to store passwords."
arch=('i686' 'x86_64')
url='http://www.guillermomolina.com.ar/index.php/en/projects/firefox-kwallet-extension'
source=('svn+http://svn.guillermomolina.com.ar/firefox-kde-wallet-2')
license=('MPL' 'GPLv2' 'LGPL')
depends=('kdelibs' 'nspr' 'firefox' 'xulrunner' 'kdeutils-kwalletmanager')
makedepends=('automoc4' 'svn' 'cmake')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_svnname"
  emversion=$(_extract_version_from_manifest)

  # Format: extension version (2.3) -dot- VCS revision number
  echo ${emversion}.$(svnversion)
}

build() {
  cd "$srcdir/$_svnname"

  mkdir build
  cd build
  cmake ../library
  make
  cd -
  make
  make archive
}

package() {
  cd "$srcdir"

  # Extract extension ID and version from manifest
  emid=$(_extract_id_from_manifest)
  emversion=$(_extract_version_from_manifest)
  dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"

  unzip -qqo firefox-kde-wallet-${emversion}.xpi -d xpicontents

  install -d "$dstdir"
  cp -dr --no-preserve=ownership xpicontents/* "$dstdir"
}

_extract_id_from_manifest() {
  cd "$srcdir/$_svnname/xpi"
  sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' \
      install.rdf | tr -d '\n'
}

_extract_version_from_manifest() {
  cd "$srcdir/$_svnname/xpi"
  sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' \
      install.rdf | tr -d '\n'
}
