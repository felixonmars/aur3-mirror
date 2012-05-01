# Maintainer: philomath <philomath868 AT gmail DOT com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>
pkgname=nrgrep
pkgver=1.1.2
pkgrel=2
pkgdesc="a very fast grep implementation (much faster than e.g. GNU grep)"
url="http://www.dcc.uchile.cl/~gnavarro/software/"
arch=(i686 x86_64)
license=('custom')
depends=('glibc')
source=(http://www.dcc.uchile.cl/~gnavarro/software/nrgrep.tar.gz
        quiet.patch)
md5sums=('509a4542ba88963f2b9811a196055b15'
         '21b2cf8b26ef660fdedc116995b303c1')

build() {
  cd $srcdir
  patch -Np1 -i quiet.patch
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install $srcdir/$pkgname-$pkgver/nrgrep $pkgdir/usr/bin/nrgrep
  mkdir -p $pkgdir/usr/share/licenses/nrgrep
  install $srcdir/$pkgname-$pkgver/COPYRIGHT $pkgdir/usr/share/licenses/nrgrep/COPYING
}
