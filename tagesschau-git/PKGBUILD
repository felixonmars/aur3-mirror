# Contributor: jens-na <jens at 0x6a dot de>

pkgname=tagesschau-git
_gitname=tagesschau
pkgver=0b7706a
pkgrel=1
pkgdesc="outputs the URL to the lates broadcast of Tagesschau"
arch=('any')
url="https://github.com/jens-na/tagesschau"
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
source=('git://github.com/jens-na/tagesschau.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -Dm755 "$srcdir/tagesschau/tagesschau" "$pkgdir/usr/bin/tagesschau"
}
