# Maintainer: Simon K <simon@booya.at>
pkgname="python2-pyfoam-svn"
pkgver="0.6.2"
pkgrel=1
pkgdesc="OpenFoam helper-library for python"
arch=('i686' 'x86_64')
url="http://openfoamwiki.net/index.php/Contrib_PyFoam"
license=('GPL')
depends=('python2' 'vtk')
makedepends=('subversion')
source=("$pkgname::svn+https://svn.code.sf.net/p/openfoam-extend/svn/trunk/Breeder/other/scripting/PyFoam/")
md5sums=('SKIP')


build() {
  cd $pkgname

}

package() {
  cd $pkgname
  #mv images/xflr5_128.png $pkgdir/usr/share/icons/hicolor/128x128/
  python2 setup.py install --root="$pkgdir/"
}
