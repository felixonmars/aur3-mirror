# Maintainer: <archlinux@kalenz.net>
# Contributor: <nslqqq@gmail.com>

pkgname=python2-clang
pkgver=3.5.0
pkgrel=1
pkgdesc="Original clang bindings for python"
arch=(any)
url="http://clang.llvm.org/"
license=('University of Illinois/NCSA')
depends=('clang' 'python2')
source=("http://llvm.org/releases/$pkgver/cfe-$pkgver.src.tar.xz"
        "setup.py")
sha1sums=('834cee2ed8dc6638a486d8d886b6dce3db675ffa'
          'b0c4c88b64ec4742bed0af6bcd4e8a2c3d4d11a4')

package() {
  cp setup.py "$srcdir/cfe-$pkgver.src/bindings/python"
  cd "$srcdir/cfe-$pkgver.src/bindings/python"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
