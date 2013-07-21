# $Id: PKGBUILD 83395 2013-01-31 09:42:11Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgbase=bullet-old
_pkgbase=bullet
pkgname=bullet-old
true && pkgname=('bullet-old' 'bullet-old-docs')
_rev=2440
pkgver=2.79
pkgrel=2
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation"
arch=('i686' 'x86_64')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
depends=()
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa')
source=(http://bullet.googlecode.com/files/${_pkgbase}-${pkgver}-rev${_rev}.tgz
        ${_pkgbase}.pc)
md5sums=('29d6f43964d8494f0366cd69e4883dd1'
         'd1da06deba3b08b884d2212f6838905c')

build() {
  cd ${_pkgbase}-${pkgver}

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build 

  # generate CMake Makefile
  cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DBUILD_SHARED_LIBS=1 \
       -DBUILD_DEMOS=0 \
       -DBUILD_MULTITHREADING=1 \
       -DBUILD_EXTRAS=1 \
       -DINSTALL_LIBS=1 \
       -DINSTALL_EXTRA_LIBS=1 \
       -DCMAKE_BUILD_TYPE=Release # set =Debug for debugging version

  # compile
  make

  # generate docs
  cd ..
  sed -i 's/GENERATE_HTMLHELP.*//g' Doxyfile
  doxygen
}

package_bullet-old() {
  optdepends=('bullet-old-docs: documentation')
  provides=('bullet=2.79')
  conflicts=('bullet')

  cd ${_pkgbase}-${pkgver}/build

  # install it
  make DESTDIR=${pkgdir} install

  # manually handle pkgconfig file
  mkdir -p "${pkgdir}"/usr/lib/pkgconfig
  sed "s|VERSION|${pkgver}|g" ${srcdir}/bullet.pc > ${pkgdir}/usr/lib/pkgconfig/bullet.pc

  # install license
  install -Dm644 ../BulletLicense.txt ${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE
}

package_bullet-old-docs() {
  pkgdesc="Documentation for bullet"
  depends=()

  cd ${_pkgbase}-${pkgver}

  # install docs
  install -Dm644 Bullet_User_Manual.pdf ${pkgdir}/usr/share/doc/bullet/Bullet_User_Manual.pdf
  cp -r html ${pkgdir}/usr/share/doc/bullet/html  
}
# vim: sw=2 ts=2 et:
