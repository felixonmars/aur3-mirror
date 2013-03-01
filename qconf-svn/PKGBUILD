# Contributor: DsTr <kostindima@gmail.com>

pkgname=qconf-svn
pkgver=816
pkgrel=1
pkgdesc="QConf allows you to have a nice configure script for your qmake-based project."
arch=(i686 x86_64 ppc)
url="http://delta.affinix.com/qconf/"
license=('GPL')
depends=(qt4)
makedepends=(subversion)
provides=(qconf)
conflicts=(qconf)
replaces=(qconf)
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://delta.affinix.com/svn/trunk/qconf/
_svnmod=qconf-svn

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  ./configure --prefix=/usr
  make
  make INSTALL_ROOT="$pkgdir" install
  find $pkgdir -name ".svn" -type d | xargs rm -rf
}
