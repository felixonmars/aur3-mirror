# Maintainer: Harley Laue <losinggeneration@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=crystalspace-svn
pkgver=38214
pkgrel=3
pkgdesc="A free and portable 3D Game Development Kit written in C++"
arch=('i686' 'x86_64')
url="http://www.crystalspace3d.org/"
license=('LGPL2.1')
depends=('speex' 'libgl' 'wxgtk' 'openal' 'alsa-lib' 'python2' \
         'cegui' 'libvorbis' 'curl' 'nvidia-cg-toolkit' 'cal3d'\
         'bullet' 'assimp')
makedepends=('subversion' 'ftjam' 'swig')
provides=('crystalspace')
conflicts=('crystalspace' 'crystalspace-1.4branch-svn')
source=(crystalspace.profile)
md5sums=('f0bdbbc6200ce99186d0dd7968735b50')

_svntrunk=http://crystal.svn.sourceforge.net/svnroot/crystal/CS/trunk
_svnmod=crystalspace

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
      (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
      svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}"/${_svnmod}-build
  cp -ru "${srcdir}"/${_svnmod}/ "${srcdir}"/${_svnmod}-build/
  cd "${srcdir}"/${_svnmod}-build

  # Ode's plugin does not compile & java isn't found with jdk7
  PYTHON=python2 ./configure --prefix=/opt --sysconfdir=/etc --without-java --with-python --without-ode --disable-make-emulation
  jam
}

package() {
  cd "${srcdir}"/${_svnmod}-build
  jam DESTDIR="${pkgdir}"/opt/crystalspace install
  install -D -m755 "${srcdir}"/crystalspace.profile "${pkgdir}"/etc/profile.d/crystalspace.sh

  install -d -m755 "${pkgdir}"/usr/lib
  mv "${pkgdir}"/opt/crystalspace/lib/python* "${pkgdir}"/usr/lib

  install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  echo '/opt/crystalspace/lib' > "${pkgdir}"/etc/ld.so.conf.d/crystalspace.conf
}

# vim:set ts=2 sw=2 et:
