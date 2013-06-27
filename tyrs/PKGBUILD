# Maintener: Nic0 <nicolas.caen@gmail.com>
# Maintainer: Marius Nestor <marius at softpedia dot com>

pkgname=tyrs
pkgver=0.6.2
pkgrel=3
pkgdesc="Tyrs is a twitter and identi.ca client based on ncurses."
arch=('any')
url="http://tyrs.nicosphere.net"
license=('GPLv3')
depends=('gettext' 'python-distutils-extra' 'python2-distribute' 'python2-twitter' 'python2-urwid')
source=("http://pypi.python.org/packages/source/t/tyrs/tyrs-${pkgver}.tar.gz")
md5sums=('247c32aadeaebaa6e6589afd9f410b5d')

build() {
  cd "$srcdir"

  tar xvf $pkgname-$pkgver.tar.gz && cd $pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
