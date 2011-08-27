# Maintainer: PyrO_70 <brieuc.roblin at gmail dot com>
pkgname=ptmegaupload-cli-git
pkgver=20110605
pkgrel=2
pkgdesc="Megaupload Search & Download - Command line (Requires premium account)"
arch=('i686' 'x86_64')
url=http://www.pyrotools.org/
license=('GPL')
depends=('qt')
makedepends=('git')

_gitroot=git://gitorious.org/ptmegaupload/ptmegaupload.git
_gitname=ptmegaupload

build() {
  cd "$srcdir"

  msg2 "Connecting to GIT server..."

  if [ -d ${_gitname} ] ; then
    ( cd ${_gitname} && git pull )
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd "$_gitname"

  msg2 "Starting make..."
  qmake INSTALL_PREFIX=/usr INTERFACE=cli
  make
}

package() {
  cd "$srcdir/$_gitname"
  msg2 "Packing..."
  make INSTALL_ROOT=${pkgdir} install
}
