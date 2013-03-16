# Maintainer: Cravix < dr dot neemous at gmail dot org >
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=e-modules-extra-eweather-svn
_origname=e-modules-extra-svn
pkgver=83648
pkgrel=1
pkgdesc="Extra gadgets for e17"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org"
license=('GPLv2' 'LGPLv2' 'MIT')
depends=('enlightenment17')
makedepends=('subversion')
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/eweather"
_svnmod="eweather"

build() {
   cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh --prefix=/usr
  make

} 

package() {
  cd $srcdir/$_svnmod-build
  make DESTDIR=$pkgdir install

# install license files
 if [ -e $srcdir/$_svnmod-build/COPYING ]; then
   install -Dm644 $srcdir/$_svnmod-build/COPYING \
       $pkgdir/usr/share/licenses/$_origname/$_svnmod/COPYING
 fi

 if [ -e $srcdir/$_svnmod-build/COPYING-PLAIN ]; then
   install -Dm644 $srcdir/$_svnmod-build/COPYING-PLAIN \
       $pkgdir/usr/share/licenses/$_origname/$_svnmod/COPYING-PLAIN
 fi
 
 rm -r $srcdir/$_svnmod-build

}
