pkgname=qutim-plugin-histman-svn
pkgver=12
pkgrel=1
pkgdesc="History Manager for Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=('subversion')
provides=('qutim-plugin-histman')
conflicts=('qutim-plugin-histman')
replaces=('qutim-plugin-histman')

_svnmod=histman
_svntrunk=http://qutim.org/svn/$_svnmod/trunk

build() {
msg "Downloading from $_svntrunk ..."
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $srcdir/$_svnmod-build

msg "Building and installing..."  
  qmake CONFIG+=silent|| return 1
  make || return 1
  install -Dm 644 libhistman.so \
                    $pkgdir/usr/lib/qutim/libhistman.so || return 1 

msg "Removing temporary files..."
  cd $srcdir
  rm -rf $_svnmod-build
}
