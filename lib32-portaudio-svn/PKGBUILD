# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-portaudio-svn
pkgver=1828
pkgrel=1
pkgdesc="A free, cross platform, open-source, audio I/O library. (32 bit)"
arch=('x86_64')
url="http://www.portaudio.com"
license="custom"
depends=('lib32-alsa-lib' 'lib32-jack' 'portaudio-svn')
makedepends=('subversion' 'gcc-multilib')
conflicts=('lib32-portaudio')
provides=('lib32-portaudio')
options=('!libtool')

_svntrunk=https://subversion.assembla.com/svn/portaudio/portaudio/trunk
_svnmod=portaudio

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  msg "Connecting to SVN server...."
  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  svn export --quiet "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr --with-alsa --with-jack --libdir=/usr/lib32
  make
}

package() {
  cd "${_svnmod}-build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
