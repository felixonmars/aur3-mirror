# Maintainer: dryes <joswiseman@gmail>
pkgname='flac2alac-git'
pkgver=20120107
pkgrel=1
pkgdesc='A shell script to convert FLAC (Free Lossless Audio Codec) files to ALAC (Apple Lossless Audio Codec).'
url='https://github.com/nighto/flac2alac'
arch=('any')
license=('GPL3')
depends=('flac' 'ffmpeg' 'libmp4v2')
makedepends=('git')
provides=('flac2alac')

_gitroot='git://github.com/nighto/flac2alac.git'
_gitname='flac2alac'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout.'
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/flac2alac/bin/flac2alac" "${pkgdir}/usr/bin/flac2alac"
}
