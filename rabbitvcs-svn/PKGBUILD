# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=rabbitvcs-svn
pkgver=r3231
pkgrel=1
pkgdesc="RabbitVCS is a set of graphical tools written to provide simple and straightforward access to the version control systems you use."
arch=('i686' 'x86_64')
url="http://code.google.com/p/rabbitvcs/"
license=('GPL')
groups=()
depends=(
  'git'
  'meld'
  'subversion>=1.4.6'
  'pygtk>=2.12'
  'python2-gobject>=2.14'
  'python2-pysvn>=1.5.2'
  'python2-dulwich>=0.6.0'
  'python2-configobj>=4.4.0'
  'python2-simplejson')
makedepends=('subversion')
provides=('rabbitvcs')
conflicts=('rabbitvcs')
install=rabbitvcs-svn.install
source=("rabbitvcs::svn+http://rabbitvcs.googlecode.com/svn/trunk/")
noextract=()
md5sums=(SKIP) #generate with 'makepkg -g'

_svntrunk=http://rabbitvcs.googlecode.com/svn/trunk/
_svnmod=rabbitvcs

pkgver(){
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$_svnmod"

  # Fix references to python, so they refer to python2
  sed -i "s#env python#env python2#" setup.py
  find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g' 
}

package() {
  cd "$srcdir/$_svnmod"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
