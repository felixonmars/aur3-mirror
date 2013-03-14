# Maintainer: Kelvin (qpalz) <kelvin9302104 at gmail dot com>

pkgname=wxmathplot
pkgver=0.1.2
pkgrel=1
pkgdesc="wxMathPlot is an add-on library for wxWidgets which provides a framework for easy plotting of mathematical functions, sampled data and generic 2D plots."
arch=(i686 x86_64)
url="http://wxmathplot.sourceforge.net"
license=(custom:wxWindows)
depends=(wxgtk)
makedepends=(cmake)
source=("http://downloads.sourceforge.net/wxmathplot/wxMathPlot-${pkgver}.tar.gz")
md5sums=('40ebdc284ca29a09309ff1eb0b5c0562')

build()
{
	cd "$srcdir/wxMathPlot-$pkgver"

	sed -i -e's/::wxLogError/wxLogError/g' mathplot.cpp
	sed -i -e's/#define new DEBUG_NEW/\/\/#define new DEBUG_NEW/g' mathplot.cpp

	cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr .
	make
}

package()
{
	cd "$srcdir/wxMathPlot-$pkgver"

	make install
}

