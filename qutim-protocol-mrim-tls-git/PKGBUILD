# Contributor: Lex Rivera <x-demon@x-demon.org> modify by bkmz <libbkmz.dev@gmail.com>
pkgname=qutim-protocol-mrim-tls-git
pkgver=20100827
pkgrel=1
pkgdesc="Mrim protocol for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=()
optdepends=()
provides=()

_gitroot="git://gitorious.org/qutim/protocols.git"
_gitname="protocols/mrim"

build() {
msg "Git checkout"
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname 
  git pull origin master || return 1
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi
git checkout origin/sdk02
git pull origin sdk02
msg "Git checkout done or server timeout"
msg "Creating temporary build directory..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
#  cd $srcdir/$_gitname-build

msg "Building and installing..." 
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make DESTDIR=${pkgdir} install || return 1

msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
# vim:syntax=sh
