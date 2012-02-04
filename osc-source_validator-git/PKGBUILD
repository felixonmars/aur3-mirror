# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=osc-source_validator-git
pkgver=20110930
pkgrel=1
pkgdesc="OSC is checking valid sources on pre-checkin via this"
url="https://gitorious.org/opensuse/osc-source_validator"
arch=('any')
license=('GPL2')
makedepends=('git')
provides=('osc-source_validator')
conflicts=('osc-source_validator')

_gitroot="git://gitorious.org/opensuse/osc-source_validator.git"
_gitname="osc-source_validator"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  install -d "${pkgdir}"/usr/lib/osc/source_validators
  cp -a [0-9]* helpers "${pkgdir}"/usr/lib/osc/source_validators
}
