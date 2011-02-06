# Contributor: epsy < epsy46 at free dot fr >

pkgname=netradiant-unfree-svn
pkgver=419
pkgrel=2
pkgdesc="The bleeding edge version of the Q3A/Nexuiz \
         level map editor"
url="http://icculus.org/netradiant/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gtkglext' 'libxml2' 'zlib' 'libpng')
replaces=('netradiant-unfree-svn')
provides=('netradiant-svn')
makedepends=('subversion')

source=(http://epsy46.free.fr/code/netradiant/q3map2.sh)
md5sums=('fef4f71202db352395d68dabcbc9499a')

_svntrunk=svn://svn.icculus.org/netradiant/trunk
_svnmod=netradiant

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/$_svnmod/.svn ]; then
    (cd ${srcdir}/$_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver ${srcdir}/$_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Downloading all gamepacks"

  cd ${srcdir}/$_svnmod
  echo $PWD
  BATCH=1 sh ./download-gamepacks.sh

  msg "Starting make..."

  cp -r ${srcdir}/$_svnmod ${srcdir}/$_svnmod-build
  cd ${srcdir}/$_svnmod-build

  make || return 1

  mkdir -p ${pkgdir}/opt/
  mkdir -p ${pkgdir}/usr/bin/

  cp -TR install ${pkgdir}/opt/netradiant/
  cp $srcdir/q3map2.sh ${pkgdir}/usr/bin/q3map2
  chmod +x ${pkgdir}/usr/bin/q3map2

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
