# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fife-rpg-git
pkgver=v0.1c.r49.g3d8a887
pkgrel=1
pkgdesc="FIFErpg is a framework for creating games utilizing a component-based entity system. It uses the FIFEngine and a modified version of the Grease framework."
arch=(any)
url="http://fife-rpg.github.io/"
license=('GPL3')
depends=('python2>=2.7' 'fife-git' 'python2-yaml' 'bgrease-git')
makedepends=('git')
provides=('fife-rpg')
source=("$pkgname"::'git://github.com/fife-rpg/fife-rpg.git'#branch=fife_git)
md5sums=('SKIP')
_gitroot='fife-rpg'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_gitroot}
  python2 setup.py install --home=$pkgdir/usr || return 1
}
package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  mv $pkgdir/usr/lib/python/* $pkgdir/usr/lib/python2.7/site-packages/
  rm -rf $pkgdir/usr/lib/python
}
