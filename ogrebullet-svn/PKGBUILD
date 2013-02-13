# Contributor: Iwan Gabovitch (qubodup) <qubodup@gmail.com>
# Maintainer: Andrew Cook (ariscop) <ariscop@gmail.com>
pkgname=ogrebullet-svn
pkgver=2978
pkgrel=2
pkgdesc="Bullet Physics wrapper for OGRE"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/addonforums/viewtopic.php?f=12&t=4155"
license=('lgpl')
depends=(ogre bullet boost)
makedepends=(subversion)
source=(fix.patch)

_svntrunk="https://ogreaddons.svn.sourceforge.net/svnroot/ogreaddons/trunk/ogrebullet"
_svnmod="ogrebullet-svn"

build() {

  cd ${srcdir}

  msg "Starting Subversion checkout..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "Subversion checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/
  rm -rf ${pkgname}-build
  cp -r ${pkgname} ${pkgname}-build
  cd ${pkgname}-build/
  pwd
  patch -p1 < ${srcdir}/fix.patch
  sed -i 's\"ConvexBuilder.h"\"ConvexDecomposition/ConvexBuilder.h"\' Collisions/src/Utils/OgreBulletCollisionsMeshToShapeConverter.cpp
  sed -i 's\AM_CONFIG_HEADER\AC_CONFIG_HEADERS\' configure.ac
  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix /usr
  make LDFLAGS="-lConvexDecomposition" || return 1
  make DESTDIR=${pkgdir} install || return 1

}

md5sums=('9dbc6979c94c87a968689f73d17ab2c8')
