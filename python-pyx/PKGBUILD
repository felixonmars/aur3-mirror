# contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-pyx
pkgver=0.13
pkgrel=1
pkgdesc="Python library for the creation of PostScript and PDF files"
arch=('any')
url="http://pyx.sourceforge.net"
license=('GPL')
depends=('python' 'texlive-core')
source=(http://downloads.sourceforge.net/sourceforge/pyx/PyX-$pkgver.tar.gz)
md5sums=('aeda519f5b3f118a9c940c82758489d0')

package() {
  cd $srcdir/PyX-$pkgver
  python setup.py install --root=$pkgdir
}
