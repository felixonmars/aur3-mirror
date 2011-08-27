# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Andreas Zwinkau <beza1e1@web.de>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=pigment-python-classic
_realname=pigment-python
pkgver=0.3.12                                                     
pkgrel=1
pkgdesc="Pigment Python library and bindings, required by moovida-classic"
arch=('i686' 'x86_64')
url="https://code.fluendo.com/pigment/trac"
license=('GPL')
depends=('python2>=2.7' 'pigment-classic>=0.3.15' 'pygobject')
options=('!libtool')
source=(http://elisa.fluendo.com/static/download/pigment/$_realname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_realname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

md5sums=('dd42ce291be4d37d9a933c9e3cd71590')
