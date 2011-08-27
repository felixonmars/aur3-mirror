# Maintainer: Adam Lloyd <lloyda2 (at) rpi (dot) edu>
# Contributor: Michael Klier <chi@chimeric.de>
pkgname=pykanjicard
pkgver=1.3
pkgrel=1
pkgdesc="A flash card program to aid learning japanese written words, in hiragana, katakana and kanji"
url="http://sourceforge.net/projects/pykanjicard"
arch=('i686' 'x86_64')
license=("GPL")
depends=('pygtk')
makedepends=('setuptools')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c1e39ef91fc52f14872c63cf5c79688f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python setup.py install --root ${pkgdir}
}

# vim:ts=4:sw=4:noet:enc=utf-8:
