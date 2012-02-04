# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=edje-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="A graphical design and layout library based on Evas, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('BSD')
depends=('ecore-svn' 'embryo-svn' 'python2' 'lua' 'shared-mime-info')
makedepends=('subversion')
conflicts=('edje' 'edje-svn')
provides=('edje' 'edje-svn')
install=edje.install
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/edje"
_svnmod="edje"

build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  # python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' utils/inkscape2edc

  ./autogen.sh --prefix=/usr --enable-amalgamation
  make
}

package(){
  cd $srcdir/$_svnmod-build

  make DESTDIR=$pkgdir install

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING

  rm -r $srcdir/$_svnmod-build

}
