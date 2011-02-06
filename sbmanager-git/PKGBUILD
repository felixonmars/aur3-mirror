# Contributor: Matías Hernández <msdark@archlinux.cl>
pkgname=sbmanager-git
pkgver=20101016
pkgrel=3
pkgdesc="Manage iPhone/iPod Touch SpringBoard icons from the computer"
arch=(i686 x86_64)
url="http://cgit.sukimashita.com/sbmanager.git/"
license=('GPL')
groups=(system)
depends=(usbmuxd libimobiledevice clutter clutter-gtk intltool)
makedepends=('git')
provides=(sbmanager)
conflicts=()
replaces=()
backup=()
options=()
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
#md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.sukimashita.com/sbmanager.git"
_gitname="sbmanager"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
