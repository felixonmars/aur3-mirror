# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-x86_64
pkgver=3.5.5378
pkgrel=1

pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"
arch=('x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk>=2.8')
makedepends=('binutils' 'tar')
install=codelite.install
conflicts=('codelite' 'codelite-svn' 'codelite-bin')
replaces=('codelite' 'codelite-svn' 'codelite-bin')
provides=('codelite' 'codelite-svn' 'codelite-bin')

source=('http://downloads.sourceforge.net/project/codelite/Releases/codelite-3.5/codelite_3.5.5378-ubuntu0_amd64.deb')
md5sums=('5d3f8a1286863e290f6fc0ef8759990d')

build() {
    cd $srcdir/
	ar x *.deb
	tar xzvf data.tar.gz
    cp -r $srcdir/usr $pkgdir
}


