# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Holger Vogel <holger.vogel@gmail.com>
pkgname=gips
pkgver=0.7
pkgrel=1
pkgdesc="The ISOTOPIC PATTERN CALCULATOR is a small linux tool for mass spectrometry. It calculates the isotopic distribution for a 
given chemical formula or peptide sequence.GIPS is a GUI Version of the Isotopic Pattern Calculator."
arch=('i686' 'x86_64')
url="http://isotopatcalc.sourceforge.net"
license=('GPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/isotopatcalc/GIPS/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('4e1580a2647f7b0b24e708b8d4527451')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
