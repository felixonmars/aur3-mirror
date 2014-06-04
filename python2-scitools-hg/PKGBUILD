# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=python2-scitools-hg
pkgver=r725.d861867154e2
pkgrel=5
pkgdesc="python library for scientific computing, Mercurial version"
arch=(any)
url="http://code.google.com/p/scitools/"
license=('custom:BSD Simplified')
depends=('python2') 
makedepends=('python2' 'python2-numpy' 'gnuplot' 'python2-gnuplot' 'mercurial')
optdepends=('python2-scipy' 'python2-scientificpython' 'vtk')
provides=('python2-scitools')
conflicts=('python2-scitools')
source=('hg+http://code.google.com/p/scitools')
md5sums=('SKIP')

pkgver() {
 # Identify latest version.
 cd "$srcdir/scitools"
 printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}  

package() {
  # Remove unwanted source folder.
  rm -r $startdir/scitools

  # Install the package.
  cd "$srcdir/scitools"
  python2 setup.py install --root=$pkgdir

  # Copy the license file.
  mkdir -pv $startdir/pkg/$pkgname/usr/share/licenses/$pkgname
  install -m644 $srcdir/scitools/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}


