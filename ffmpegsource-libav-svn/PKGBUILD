pkgname=ffmpegsource-libav-svn
pkgver=742
pkgrel=1
pkgdesc="An FFmpeg based source library and Avisynth plugin for easy frame accurate access, with embedded libav libraries from GIT"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ffmpegsource/"
license=('GPL3' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'subversion' 'yasm')
conflicts=('ffmpegsource' 'ffmpegsource2-svn')
provides=('ffmpegsource')
options=('!libtool')

_svntrunk="http://ffmpegsource.googlecode.com/svn/trunk/"
_svnmod="ffmpegsource"

_gitavroot="git://git.libav.org/libav.git"
_gitavname="libav"

build() {
  cd "${srcdir}"
  [ -d build ] && rm -fr build

  msg "Connecting to SVN server...."

  if [ -d "${_svnmod}" ] ; then
    cd "${_svnmod}" && svn update
    msg "The local files are updated."
  else
    svn co "${_svntrunk}" "${_svnmod}"
  fi
  msg "SVN checkout done or server timeout"

  rm -fr "${srcdir}/${_svnmod}-build"
  cp -R "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}"

  msg "Connecting to the Git repository..."

  if [ -d "${_gitavname}" ] ; then
    cd "${_gitavname}" && git pull
    msg "The local files are updated."
  else
    git clone --depth=1 "${_gitavroot}" "${_gitavname}"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitavname}-build"
  cp -R "${srcdir}/${_gitavname}" "${srcdir}/${_gitavname}-build"
  cd "${srcdir}/${_gitavname}-build"

  ./configure --prefix="${srcdir}/build" --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,av{conv,play,probe,server},doc,vdpau} --enable-pic
  make
  make install

  cd "${srcdir}/${_svnmod}-build"

  PKG_CONFIG_LIBDIR="${srcdir}/build/lib/pkgconfig" ./configure --prefix=/usr
  make

}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/ffmpegsource-libav-svn/COPYING.MIT"
}
