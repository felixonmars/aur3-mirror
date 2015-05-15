# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=lyxblogger
pkgver=0.42
pkgrel=1
pkgdesc="LyXBlogger allows you to post to your WordPress blog right from LyX"
url="http://www.nongnu.org/lyxblogger"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2>=2.4')
makedepends=()
optdepends=('elyxer: eLyXer format support')
source=("http://nongnu.uib.no/$pkgname/LyXBlogger_$pkgver.tar.gz")
md5sums=('145234312501bd78a028be4506988739')

build() {
  cd "$srcdir/LyXBlogger_$pkgver/INSTALL"
  sed -i 's/python/python2/g' lyxblogger.py
}

package() {
    cd "$srcdir/LyXBlogger_$pkgver/INSTALL"
    python2 setup-no-elyxer.py install --prefix=/usr --root="$pkgdir"
}
