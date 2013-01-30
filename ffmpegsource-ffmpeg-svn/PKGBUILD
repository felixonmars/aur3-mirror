pkgname=ffmpegsource-ffmpeg-svn
pkgver=743
pkgrel=1
pkgdesc="An FFmpeg based source library and Avisynth plugin for easy frame accurate access, with embedded ffmpeg libraries from GIT"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ffmpegsource/"
license=('MIT' 'LGPL2.1')
makedepends=('git' 'subversion' 'yasm')
conflicts=('ffmpegsource')
provides=('ffmpegsource')
options=('!libtool')

_svntrunk="http://ffmpegsource.googlecode.com/svn/trunk/"
_svnmod="ffmpegsource"

_gitavroot="git://source.ffmpeg.org/ffmpeg.git"
_gitavname="ffmpeg"

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

  ./configure --prefix="${srcdir}/build" --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,ff{mpeg,play,probe,server},doc,vdpau} --enable-pic
  make
  make install

  cd "${srcdir}/${_svnmod}-build"

  PKG_CONFIG_LIBDIR="${srcdir}/build/lib/pkgconfig" ./configure --prefix=/usr
  make

}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/ffmpegsource-ffmpeg-svn/COPYING.MIT"
}
