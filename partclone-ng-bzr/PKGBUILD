# Author: M0Rf30

#Maintainer: Gianluca Boiano (aka M0Rf30)

pkgname=partclone-ng-bzr
pkgver=88
pkgrel=1
pkgdesc="Partimage-ng is a disk and partition imaging program."
arch=('i686' 'x86_64')
url="https://launchpad.net/partimage-ng"
license=('GPL')
depends=('e2fsprogs' 'ntfs-3g' 'boost' 'parted')
_bzrbranch=lp:partimage-ng
_bzrmod=trunk

build() {
  msg "Connecting to the server..."

  rm -rf fake-bzr-home || return 1
  mkdir fake-bzr-home || return 1
  export BZR_HOME="${srcdir}/fake-bzr-home"

  if test -d ${_bzrmod}; then
    (cd ${_bzrmod} \
       && bzr clean-tree --force --ignored --unknown \
       && bzr revert \
       && bzr switch --force "${_bzrbranch}") \
      || return 1
  else
    bzr checkout "${_bzrbranch}" ${_bzrmod} || return 1
  fi

  msg "BZR synchronization done"
  msg "Starting make..."

  cd "${srcdir}/${_bzrmod}" || return 1
        cmake .  -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

