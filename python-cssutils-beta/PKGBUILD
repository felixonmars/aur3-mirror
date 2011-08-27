# Contributor: Michal Marek <reqamst at gmail dot com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor: Lars Jacob <jacob. lars at gmail . com

pkgname=python-cssutils-beta
pkgver=0.9.7b4
pkgrel=1
pkgdesc="A CSS Cascading Style Sheets library for Python (Beta)"
arch=('any')
url="http://code.google.com/p/cssutils/"
license=('LGPL3')
conflicts=('python-cssutils-legacy' 'python-cssutils')
depends=('python2')
makedepends=('unzip' 'setuptools')
source=(http://cssutils.googlecode.com/files/cssutils-$pkgver.zip)
md5sums=('ecc1fee61fad1dd0e64e1b1de478b97b')

build() {
  cd "$srcdir/cssutils-$pkgver"
  python2 setup.py install --root="$pkgdir" || return 1
}
