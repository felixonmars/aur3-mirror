# contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-pyx
pkgver=0.12.1
pkgrel=1
pkgdesc="Python library for the creation of PostScript and PDF files"
arch=('any')
url="http://pyx.sourceforge.net"
license=('GPL')
depends=('python2' 'texlive-core')
source=(http://downloads.sourceforge.net/sourceforge/pyx/PyX-$pkgver.tar.gz)
md5sums=('04263eb002553dae0e8a1d0eeb805ec1')

build() {
    cd $srcdir/PyX-$pkgver
    python2 setup.py install --root=$pkgdir
   }
