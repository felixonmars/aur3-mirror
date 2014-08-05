# Maintainer: willemw <willemw12@gmail.com>
# Contributor: solid <patrick.schwalm (at) googlemail.com
# Contributor: J. W. Birdsong <@gmail.com>

_pkgname=backintime-kde4
pkgname=$_pkgname-bzr
pkgver=r896
pkgrel=1
pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault (KDE4 version)"
url="http://backintime.le-web.org"
license=('GPL')
arch=('any')
depends=('backintime-bzr' 'kdebindings-python2' 'kdesu' 'kdesdk-kompare' 'python2-pyqt4')
# Note: 'kdebindings-python2' contains kwallet's python language bindings
optdepends=('kdeutils-kwallet: for storing passwords'
            'python2-secretstorage: for storing passwords')
makedepends=('bzr')
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::bzr+https://code.launchpad.net/~bit-team/backintime/trunk)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $_pkgname
  sed -i "s|^\(Name=Back In Time\)$|\1 (KDE)|" kde4/backintime-kde4.desktop
  sed -i "s|^Name=Back In Time (root)$|Name=Back In Time (KDE, root)|" kde4/backintime-kde4-root.desktop
}

build() {
  cd $_pkgname/kde4
  ./configure --python2 --no-check
  make 
}

package() {
  cd $_pkgname/kde4
  make DESTDIR="$pkgdir" install 
}

