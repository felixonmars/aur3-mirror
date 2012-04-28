# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>
# Contributor: Gleb Javorsky <javorsky.gleb@gmail.com>
pkgname=kaa-display
pkgver=0.1.0
pkgrel=3
pkgdesc="Python API providing Low level support for various displays, such as X11 or framebuffer"
arch=('i686' 'x86_64')
url="http://freevo.sourceforge.net/kaa"
license=('LGPL')
groups=()
depends=('kaa-base' 'kaa-imlib2' 'python-pygame')
makedepends=('python2-distribute')
conflicts=('kaa-svn')
source=("http://downloads.sourceforge.net/project/freevo/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3a45f583b9b885aab8671b63b0f757cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr"
}
