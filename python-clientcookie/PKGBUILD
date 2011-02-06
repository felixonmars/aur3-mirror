# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=python-clientcookie
pkgver=1.3.0
pkgrel=1
pkgdesc="Python module for handling HTTP cookies on the client side."
arch=('i686' 'x86_64')
url="http://wwwsearch.sourceforge.net/ClientCookie/"
license=('BSD')
depends=('python')
makedepends=('setuptools')
source=(http://wwwsearch.sourceforge.net/ClientCookie/src/ClientCookie-$pkgver.tar.gz)

build() {
    cd $startdir/src/ClientCookie-$pkgver
    python setup.py bdist_dumb
    cd $startdir/pkg
    tar xzvf $startdir/src/ClientCookie-$pkgver/dist/ClientCookie-$pkgver.linux*.tar.gz
    install -D -m644 $startdir/src/ClientCookie-$pkgver/COPYING.txt $startdir/pkg/usr/share/licenses/$pkgname/COPYING.txt
}
md5sums=('7a43e4624299b3951ae1a442194d2185')
