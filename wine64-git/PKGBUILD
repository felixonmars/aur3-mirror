# Maintainer Nixtrian@gmail.com


pkgname=wine64-git
pkgver=20090723
pkgrel=1
pkgdesc="Interpreter for the Winidows APIs with 64bit patch (Only 64bit windows apps supported)"
url="http://www.winehq.com/"
arch=('x86_64')
license=('LGPL')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'fontconfig' 'freeglut' 'freetype2' 'gtk2' 'lcms'  'libcups' 'libgl' 'libice' 'libjpeg' 'libldap' 'libpng' 'libsasl' 'libsm' 'libusb' 'libx11' 'libxau' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'libxslt' 'libxt' 'libxtst' 'libxv' 'libxxf86vm' 'mesa' 'ncurses' 'openssl' 'libxxf86dga' 'pkgconfig' 'xproto' 'giflib' 'flex')
makedepends=('git' 'fakeroot' 'make' 'pkgconfig')
conflicts=('bin32-wine' 'bin32-wine-suse' 'wine' 'wine-git')
provides=("wine-git=$pkgver" "wine")
source=()
md5sums=()

_gitroot="git://source.winehq.org/git/wine.git"
_gitname="wine"

build() {

  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Local repository updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"

  msg "Removing old build directory..."
  rm -Irf ${srcdir}/$_gitname-build

  msg "Creating new build directory..."
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

  msg "Starting make..."
  cd ${srcdir}/$_gitname-build

  ./configure --enable-win64 --prefix=/usr || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  find ${pkgdir} -type f -name '*.la' -exec rm {} \;
}
