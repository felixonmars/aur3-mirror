# Contributor: Piotr Okoński <piotr@okonski.org>
# Maintainer: Jakub Okoński <kuba@okonski.org>
pkgname=psi-fork-git
pkgver=20101008
pkgrel=1
pkgdesc="Active fork of Psi, Jabber/XMPP client. Fixes History and provides searching in it."
arch=("i686" "x86_64")
url="http://github.com/pokonski/psi"
license=('custom')
depends=('qt' 'qca-ossl' 'qca-gnupg' 'xdg-utils' 'libxss' 'enchant')
makedepends=('git')
optdepends=('psimedia')
provides=('psi')
conflicts=('psi' 'psi-svn' 'psi-git')

_gitroot="git://github.com/pokonski/psi.git"
_gitname="psi"

build() {
  cd "$srcdir"
  msg "[Git] Connecting to server...."

  if [ -d $_gitname ] ; then
    msg "[Git] Repository existing locally"
    msg "[Git] Fetching from origin"
    cd $_gitname && git pull origin
    msg "[Git] Local files updated."
    git submodule update
  else
    msg "[Git] Cloning repository"
    git clone $_gitroot $_gitname
    cd $_gitname
    git submodule init
    git submodule update
  fi

  msg "[Git] Checkout done or server timeout"
  msg "Starting make..."

  if [ -d $srcdir/$_gitname-build ] ; then
    cd "$srcdir/$_gitname-build"
    git pull "../$_gitname"
  else
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
  fi

  #
  # BUILD HERE
  #

  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1

  # Psi License
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
} 
