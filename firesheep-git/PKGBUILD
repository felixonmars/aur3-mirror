# Contributor: Malte Schwarting <m-dot-schwarting-at-gmx-dot-net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firesheep-git
pkgver=20130213
pkgrel=1
pkgdesc="A Firefox Extension to intercep unencrypted cookies from certain websites"
arch=('i686' 'x86_64')
url="http://codebutler.github.com/firesheep"
license=('GPL')
options=(!makeflags)
optdepends=('firefox')
makedepends=('autoconf' 'git' 'boost' 'gecko-sdk' 'zip' 'hal')
install=firesheep-git.install

_gitroot="https://github.com/codebutler/firesheep.git"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d firesheep/.git ] ; then
    cd firesheep
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd firesheep
  fi

  msg "Updating Sumodule..."
  git submodule update --init

  msg "Starting autoconf..."
  ./autogen.sh --with-xulrunner-sdk=/opt/gecko-sdk
  msg "Autoconf done"

  msg "Starting make..."
  make
}

package() {
  mkdir -p ${pkgdir}/opt/mozilla
  install -m755  ${srcdir}/firesheep/build/* ${pkgdir}/opt/mozilla/
}
