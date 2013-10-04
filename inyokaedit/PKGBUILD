# Maintainer: Markus Holtermann <aur@markusholtermann.eu>
pkgname=inyokaedit
pkgver=0.11.0
_mainver=0.11
pkgrel=1
pkgdesc='A small markup editor for Inyoka articles (http://ubuntuusers.de/inyoka/). It includes syntax highlighting, offline preview, downloading raw text of existing articles...'
arch=('i686' 'x86_64')
url='https://launchpad.net/inyokaedit/'
license=('GPL3')
depends=('hunspell' 'qtwebkit' 'wget')
makedepends=('bzr')
source=("https://launchpad.net/inyokaedit/$_mainver/$pkgver/+download/inyokaedit-$pkgver-src.tar.gz")
md5sums=('4e0f24e9e0e14400ab57af1a32b3b52b')
conflicts=('inyokaedit-bzr')

build() {
    cd "$srcdir/$pkgname-$pkgver-src"
    qmake-qt4
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src"
    INSTALL_ROOT=$pkgdir make install
}
