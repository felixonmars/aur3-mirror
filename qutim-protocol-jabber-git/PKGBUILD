# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=qutim-protocol-jabber-git
pkgver=20091220
pkgrel=1
pkgdesc="Jabber protocol for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=()
optdepends=()
provides=()

_gitroot="git://gitorious.org/qutim/jabber.git"
_gitname="jabber"

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
msg "Git checkout done or server timeout"
msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

msg "Building and installing..." 
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -Dm 644 $_svnmod-build/libjabber.so $pkgdir/usr/lib/qutim/libjabber.so || return 1

msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
# vim:syntax=sh
