# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Corrado Primier <cp663137@stud.polimi.it>
# Contributor: Jens Persson <xerxes2 at gmail.com>

pkgname=pyao
pkgver=0.82
pkgrel=5
pkgdesc="Python ao wrapper library"
arch=('any')
url="http://ekyo.nerim.net/software/pyogg/"
license=('GPL')
depends=('libao' 'python2')
source=(http://ekyo.nerim.net/software/pyogg/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-gentoo.diff)
md5sums=('8e00f5154401a6f6d99efd20606e2819'
         '1faf48d6d726d510679726193cf2a45c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i ../$pkgname-$pkgver-gentoo.diff
  python2 config_unix.py --prefix=/usr
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
