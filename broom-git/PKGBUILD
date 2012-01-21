# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=broom-git
_pkgname=broom
pkgver=20120121
pkgrel=1
pkgdesc="A disk cleaning utility for developers."
arch=(any)
url="https://github.com/nicoulaj/broom"
license=(MIT)
depends=('bash>=4')
changelog=Changelog
provides=(${_pkgname})
conflicts=(${_pkgname})

_gitroot=git://github.com/nicoulaj/${_pkgname}.git
_gitname=${_pkgname}

build() {
  msg2 "Connecting to GIT server...."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    ( cd "${srcdir}/${_gitname}" && git pull origin )
    msg2 "The local files are updated."
  else
    git clone $_gitroot "${srcdir}/${_gitname}"
  fi

  msg2 "Building..."
  cd "${srcdir}/${_gitname}"
  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}"
  make install DESTDIR="${pkgdir}" || return 1
}
