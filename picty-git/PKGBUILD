# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>
_gitname=picty
pkgname=$_gitname-git
pkgver=fd6cfd5
pkgrel=1
pkgdesc="picty is a photo manager designed around metadata and a lossless approach to image handling."
arch=(any)
url="https://github.com/spillz/picty"
license=('GPLv3')
groups=()
depends=('python2' 'pygtk' 'python2-gnomedesktop' 'python2-exiv2' 'python2-pyinotify')
optdepends=('dcraw: basic raw processing support' 'totem: video thumbnailing' 'python2-flickrapi: flickr collection support' 'python2-osmgpsmap: geotagging support')
makedepends=('git')
provides=($_gitname)
conflicts=($_gitname)
replaces=()
backup=()
options=()
install=
source=(git+https://github.com/spillz/picty.git)
noextract=()
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install -O1 --root="$pkgdir"
}
