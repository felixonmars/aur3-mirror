# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: opkdx <opkdx.me@gmail.com>
pkgname=svgfig  
pkgver=1.1.6
pkgrel=1 
pkgdesc="Quantitative drawing in Python and SVG"
url="http://code.google.com/p/svgfig"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python')
source=('http://svgfig.googlecode.com/files/svgfig-1.1.6.tgz')
md5sums=('3e283bd6fd6e3ade1d3a21f33e805045')
build() {
  cd $srcdir/svgfig
  python setup.py install --root="$pkgdir" || return 1
}
