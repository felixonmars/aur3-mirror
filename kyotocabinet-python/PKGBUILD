# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyotocabinet-python
pkgver=1.22
pkgrel=1
pkgdesc="Python3 bindings for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyotocabinet/"
license=('GPL3')
depends=('kyotocabinet>=1.2.34' 'python>=3.1')
source=(http://fallabs.com/kyotocabinet/pythonpkg/$pkgname-$pkgver.tar.gz
       gcc46.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i ${srcdir}/gcc46.patch

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('301c55b68cafc56ae0f35dc4e417434b56d57f1f986154a89c3f831a143e2d10a5fa2d7e282e01b41e5f61e833b7cbab38460d2cfcdf3f3925f76843a992dc5b'
            '9a1a84c8707645aa2d039bf6d5f0714824e965450808ac0c871a4921316e36369e934851d9fff57f26da6d4ad815c5d4bc3d4b4ad8ce0bede09a94426c9202ee')
