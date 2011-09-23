# $Id$
# Maintainer: Alfonso Saavedra "Son Link" sonlink.dourden@gmail.com

pkgname=fluxbox-lua-git
pkgver=20110923
pkgrel=1
pkgdesc="A lightweight and highly-configurable window manager. Branch with LUA script support"
arch=('i686' 'x86_64')
url="http://www.fluxbox.org"
license=('MIT')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'gcc-libs' 'sh' 'imlib2' 'fribidi')
conflicts=('fluxbox' 'fluxbox-fbcompose-git')
makedepends=('pkg-config' 'git')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=(fluxbox-lua.desktop)
md5sums=('382de6c8f37b3f81000a44e1dd0db435')

_gitroot="git://git.fluxbox.org/fluxbox_pavel.git"
_gitname="fluxbox-lua"
build() {
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
  ./autogen.sh
  ./configure --prefix=/usr \
    --enable-gnome --enable-xft --enable-xinerama \
    --enable-imlib2 --enable-nls
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../fluxbox-lua.desktop "${pkgdir}/usr/share/xsessions/fluxbox-lua.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
