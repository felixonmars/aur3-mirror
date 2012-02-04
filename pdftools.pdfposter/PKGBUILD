# Maintainer: Chad Aeschliman <chadaeschliman at gmail dot com>
# Contributor: Wael Nasreddine <gandalf at siemens-mobiles dot org>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=pdftools.pdfposter
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A Python extension to manipulate pdf poster."
depends=( 'python2-distribute' 'python2' 'python-pypdf')
url="http://pdfposter.origo.ethz.ch"
source=(http://download.origo.ethz.ch/pdfposter/1095/$pkgname-$pkgver.tar.bz2)
md5sums=('2e78427991ef9d830ac2baea82998849')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
