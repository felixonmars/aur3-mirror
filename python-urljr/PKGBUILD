# Contribiutor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Based on package by:
# Maintainer: Andreas Zwinkau <beza1e1@web.de>

pkgname=python-urljr
pkgver=1.0.1
pkgrel=2
pkgdesc="URL-related utilites, including a common interface to HTTP fetchers for PycURL and urllib2"
arch=('any')
url="http://www.openidenabled.com/openid/libraries/python/urljr"
license=('LGPL')
depends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
install=
#source=("http://openidenabled.com/files/python-openid/files/python-urljr-${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::http://archive.ubuntu.com/ubuntu/pool/universe/p/python-urljr/python-urljr_1.0.1.orig.tar.gz")
noextract=()

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py bdist_dumb
  cd $pkgdir
  tar xzvf $srcdir/$pkgname-$pkgver/dist/$pkgname-$pkgver.linux*.tar.gz	
}
md5sums=('0b120d08dc4538ed5c4ee5c77447b865')
