# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=godns-git
_goname=dns
pkgver=20110731
pkgrel=1
pkgdesc="Go library for DNS protocol"
arch=('i686' 'x86_64')
url="http://github.com/miekg/godns"
license=('custom')
depends=('go')
makedepends=('git')
options=('!strip')
_gitroot="git://github.com/miekg/godns.git"
_gitname="godns"

build() {
  msg 'Connecting to GIT server...'

  if [[ -d $_gitname ]]; then
    ( cd $_gitname && git pull origin )
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf $_gitname-build
  git clone $_gitname{,-build}

  cd ${_gitname}-build
  source /etc/profile.d/go.sh
  gomake
}

package() {
  cd ${srcdir}/${_gitname}-build
  source /etc/profile.d/go.sh
  mkdir -p ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # copy source files
  cp -Rv ${srcdir}/${_gitname}/* ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # install libraries
  cp -v ${GOROOT}/src/Make.* ${pkgdir}/${GOROOT}/src/
  GOROOT=${pkgdir}/${GOROOT} gomake install
  rm -f ${pkgdir}/${GOROOT}/src/Make.*
}

# vim: set ts=2 sw=2 et:
