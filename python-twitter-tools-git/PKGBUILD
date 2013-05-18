# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=python-twitter-tools-git
pkgver=1.9.4.351.06c6e4b
pkgrel=1
pkgdesc="An API and command-line toolset for Twitter (twitter.com)"
arch=('any')
url="http://mike.verdone.ca/twitter/"
license=('MIT')
depends=('python')
makedepends=('python-distribute' 'git')
provides=('python-twitter-tools')
conflicts=('python-twitter-tools')
source=("git://github.com/sixohsix/twitter.git")
md5sums=('SKIP')

_gitname="twitter"

pkgver () {
  cd "$srcdir"/$_gitname
  echo $(git describe --always | sed 's|-|.|g' | sed 's|twitter\.||g').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {

  cd "$srcdir/$_gitname"

  python setup.py build

}

package() {

  cd "$srcdir/$_gitname"

  python setup.py install --root=$pkgdir --optimize=1


  install -D -m644 $srcdir/$_gitname/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

}

# vim:set ts=2 sw=2 et:
