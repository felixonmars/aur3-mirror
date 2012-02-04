# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=bullet-svn
pkgver=2069
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation"
arch=('i686' 'x86_64')
url="http://www.bulletphysics.com/Bullet/"
license=('zlib')
provides=('bullet')
conflicts=('bullet')
depends=()
makedepends=('cmake>=2.4' 'subversion')
source=("bullet.pc")
md5sums=('d1da06deba3b08b884d2212f6838905c')

_svntrunk=http://bullet.googlecode.com/svn/trunk/
_svnmod=bullet

build() {
  cd ${srcdir}
  
  if [ -d ${_svnmod}/.svn ]; then
  	(cd ${_svnmod} && svn up -r ${pkgver})
  else
  	svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r ${_svnmod} $_svnmod-build
  cd ${_svnmod}-build

  cmake . \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_SHARED_LIBS=1 \
	-DBUILD_DEMOS=0 \
	-DBUILD_EXTRAS=1 \
	-DINSTALL_LIBS=1 \
	-DINSTALL_EXTRA_LIBS=1

  make
  make DESTDIR=${pkgdir} install

  mkdir -p "${pkgdir}"/usr/lib/pkgconfig
  sed "s|VERSION|${pkgver}|g" ${srcdir}/bullet.pc > ${pkgdir}/usr/lib/pkgconfig/bullet.pc
  install -Dm644 BulletLicense.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  rm -rf ${_svnmod}-build
}
