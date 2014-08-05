# Maintainer: willemw <willemw12@gmail.com>
# Contributor: solid <patrick.schwalm (at) googlemail.com
# Contributor: J. W. Birdsong <@gmail.com>

_pkgname=backintime-gnome
pkgname=$_pkgname-bzr
pkgver=r896
pkgrel=1
pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault (GNOME version)"
url="http://backintime.le-web.org"
license=('GPL')
arch=('any')
depends=('backintime-bzr' 'gksu' 'meld' 'python2-libgnome')
optdepends=('gloobus-preview: for file preview'
            'python2-gnomekeyring: for storing passwords'
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
  sed -i "s|^\(Name=Back In Time\)$|\1 (GNOME)|" gnome/backintime-gnome.desktop
  sed -i "s|^Name=Back In Time (root)$|Name=Back In Time (GNOME, root)|" gnome/backintime-gnome-root.desktop
}

build() {
  cd $_pkgname/gnome
  ./configure --python2 --no-check
  make 
}

package() {
  cd $_pkgname/gnome
  make DESTDIR="$pkgdir" install 
}

