# Maintainer: Karl Kochs <captainhaggy@googlemail.com>

pkgname=manaserv-git
pkgver=20100627
pkgrel=1
pkgdesc="The Mana project builds a complete 2D MMORPG platform. This includes a client, server and web component, as well as a library of free content that you can use under the terms of the GPL. While this project started in 2009, the Mana client, server and web components were formerly being developed as part of The Mana World since 2004. By separating server/client development from a single player community, we hope to achieve better cooperation with alternative Mana server based projects."
arch=('i686' 'x86_64')
url="http://manasource.org/"
license=('GPL')
depends=('sqlite' 'lua')
makedepends=('git')
optdepends=()
provides=('manaserv')
conflicts=()
source=()
md5sums=()

_gitroot=git://gitorious.org/mana/manaserv.git
_gitname=manaserv

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_gitname-build
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

   cd ${srcdir}/manaserv
   autoreconf -i
   ./configure --prefix=/usr  #--without-opengl

   make || return 1
   make DESTDIR=${pkgdir} install
}
