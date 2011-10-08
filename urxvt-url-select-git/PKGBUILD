# Maintainer: dawn <crackofdusk at gmail dot com>

pkgname="urxvt-url-select-git"
pkgver=20111008
pkgrel=1
pkgdesc="mouseless url yanking for rxvt-unicode (urxvt)"
arch=("any")
depends=('rxvt-unicode')
conflicts=('urxvt-url-select')
install=('urxvt-url-select.install')
license=("GPL")
url='http://www.github.com/muennich/urxvt-perls'

_gitroot="http://github.com/muennich/urxvt-perls.git"
_gitname="urxvt-perls"
_extension="url-select"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin) || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname || return 1


  install -Dm644 ${_extension} \
      ${pkgdir}/usr/lib/urxvt/perl/${_extension}
}
