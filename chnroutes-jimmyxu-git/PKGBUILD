# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Guten Ye

pkgname=chnroutes-jimmyxu-git
_gitname=chnroutes
pkgver=0.46.37d256f
pkgrel=1
pkgdesc="Scripts help chinese netizen, who uses vpn to combat censorship - Jimmy Xu's fork"
arch=("any")
url="https://github.com/jimmyxu/chnroutes"
license=("unknown") 
provides=("chnroutes")
conflicts=("chnroutes")
makedepends=('git')
depends=("python2" "iproute2")
source=("git://github.com/jimmyxu/chnroutes.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_gitname"
  sed -i -r '1s/python2?/python2/' chnroutes.py
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 chnroutes.py "$pkgdir/usr/bin/chnroutes"
}

# vim:set ts=2 sw=2 et:
