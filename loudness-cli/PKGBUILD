# Maintainer: John Regan <saxindustries@gmail.com>

pkgbase=loudness-cli
pkgname=loudness-cli-git
pkgver=20111115
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A replaygain scanning and tagging program"
url="https://github.com/jiixyj/libebur128"
license=('custom:MIT')
depends=('taglib')
makedepends=('git')
optdepends=('gstreamer0.10-base: provides gstreamer input support'
            'libsndfile: provides libsndfile input support'
            'mpg123: provides mpg123 input support'
            'ffmpeg: provides ffmpeg input support'
            'libmpcdec: provides libmpcdec supprt')

_gitroot='git://github.com/jiixyj/libebur128.git'
_gitname='libebur128'

build() {
  msg 'Connecting to github...'
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone ${_gitroot}
  fi
  
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  cd ${srcdir}/${_gitname}
  
  git submodule init
  git submodule update

  mkdir build
  cd build

  cmake ..
  make loudness
}

package() {
  cd "${srcdir}/${_gitname}/build"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m755 loudness "${pkgdir}/usr/bin/"
  cd "${srcdir}/${_gitname}"
  install -m755 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
