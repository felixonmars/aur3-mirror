# Maintainer: kfgz <kfgz at interia pl>

pkgname=libvmath-svn
pkgver=101
pkgrel=1
pkgdesc="Math library for 3D graphics"
url="http://gfxtools.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
provides=(libvmath)
conflicts=(libvmath)

_svntrunk="http://gfxtools.svn.sourceforge.net/svnroot/gfxtools/libvmath"
_svnmod="libvmath"

build() {
  if [ -d ${_svnmod}/.svn ]; then
     (cd ${_svnmod} && svn up -r ${pkgver})
   else
     svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}"/libvmath
  sed -i "s/O3/O2/g" configure
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/libvmath
  install -dm755 "${pkgdir}"/usr/{lib,lib/pkgconfig,include/vmath,share/doc/libvmath}
  install -m644 libvmath.a "${pkgdir}"/usr/lib
  install -m755 libvmath.so "${pkgdir}"/usr/lib
  install -m644 vmath.pc "${pkgdir}"/usr/lib/pkgconfig
  install -m644 README "${pkgdir}"/usr/share/doc/libvmath
  cd src
  install -m644 *.h *.inl "${pkgdir}"/usr/include/vmath
}
