# Contributor: Jon Nordby <jononor@gmail.com>

_pkgname=spectacle
pkgname=$_pkgname-git
pkgver=616.9795a58
pkgrel=1
pkgdesc="Tool to work with .spec files (for RPM packaging)"
arch=('any')
url="http://wiki.meego.com/Spectacle"
license=('GPL')
depends=('python2' 'python2-cheetah' 'python2-yaml')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git://gitorious.org/meego-developer-tools/spectacle.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_pkgname"

  export PYTHON=/usr/bin/python2
  make DESTDIR="$pkgdir/" install
} 
