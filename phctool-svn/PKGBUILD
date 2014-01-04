# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=phctool-svn
pkgver=9
pkgrel=3
pkgdesc="GUI to Linux-PHC CPU undervolting"
arch=(any)
url="http://www.linux-phc.org/"
license=('GPL')
depends=('linux-phc' 'pygtk')
makedepends=('subversion')
provides=('phctool')
conflicts=('phctool')
install=phctool.install
source=(svn+http://phctool.googlecode.com/svn/trunk/
	phctool.sh
	phctray.sh)
md5sums=('SKIP'
         '39a0fa41252377cde6b0663cecbd9a85'
         'e364437b4ba3ca16a4995a5e2895a513')

_svnmod=phctool

package() {
  cd "$srcdir/trunk"

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r doc "$pkgdir/usr/share/doc/phctool"
  mkdir -p "$pkgdir/usr/lib/phctool"
  cp -r inc "$pkgdir/usr/lib/phctool/"

  sed -i 's:phctool.sh:phctool.py:g' phctray.py
  install -m755 phc{tool,tray}.py "$pkgdir/usr/lib/phctool/"
  install -Dm755 ../phctool.sh "$pkgdir/usr/bin/phctool"
  install -m755 ../phctray.sh "$pkgdir/usr/bin/phctray"

  find "$pkgdir" -name "*.pyc" -exec rm -f {} \;
  find "$pkgdir" -name "*.pyo" -exec rm -f {} \;
}
