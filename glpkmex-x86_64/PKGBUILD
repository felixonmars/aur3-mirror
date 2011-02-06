# Contributor: Daniel Milde <info@milde.cz>

pkgname=glpkmex-x86_64
origname=glpkmex
pkgver=2.8
pkgrel=2
pkgdesc="GLPKMEX - a Matlab MEX interface for the GLPK library"
arch=('x86_64')
url="http://sourceforge.net/projects/glpkmex/"
license=('GPL')
depends=('glpk')
source=(http://surfnet.dl.sourceforge.net/project/glpkmex/glpkmex/$pkgver/$origname-$pkgver-src.zip)

mexpath=/usr/local/bin/mex
matlabpath=/opt/matlab/

build() {
  cd "$srcdir/$origname"

  $mexpath -largeArrayDims -I/usr/include glpkcc.cpp /usr/lib/libglpk.a

  cd ..
  install -d ${pkgdir}${matlabpath}${origname}
  install $origname/* ${pkgdir}${matlabpath}${origname}/
}
md5sums=('34d96615db4686a791bc88ebe0492ad8')
