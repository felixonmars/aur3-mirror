# Maintainer: dryes <joswiseman@outlook>
pkgname='vorg-git'
pkgver=0.r154.eaf46a5
pkgrel=1
pkgdesc='video-organizer - organize your videos.'
url='https://github.com/JoelSjogren/video-organizer'
arch=('any')
license=('Apache')
depends=('boost' 'boost-libs')
makedepends=('scons' 'git')

_gitroot='https://github.com/JoelSjogren/video-organizer'
_gitname='video-organizer'

pkgver() {
  cd "$_gitname"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'

  cd "${srcdir}/video-organizer"
  scons
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/video-organizer/vorg" "${pkgdir}/usr/bin/vorg"
}
