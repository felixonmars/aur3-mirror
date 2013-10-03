# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=printdesign-svn
pkgver=827
pkgrel=1
pkgdesc="CorelDRAW like illustration program"
arch=('any')
url="http://sk1project.org/"
#url="https://code.google.com/p/print-design/"
license=('GPL3')
depends=('wxpython' 'uniconvertor-svn' 'desktop-file-utils')
provides=('printdesign')
install=printdesign.install
source=('printdesign::svn+http://print-design.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/printdesign"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

package() {
  cd "$srcdir/printdesign"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
