# Maintainer: Michael P <ptchinster@archlinux.us>
pkgname=mwcollectd-git
pkgver=20111128
pkgrel=5
pkgdesc="Versatile Malware Collection Daemon"
arch=('i686' 'x86_64')
url="http://www.mwcollect.org/"
license=('LGPL')
groups=()
depends=('libemu' 'libnetworkd-git' 'libnetfilter_queue')
makedepends=('git' 'libtool' 'automake>=1.9' 'autoconf')
provides=('mwcollectd')
conflicts=('mwcollectd')
replaces=()
backup=()
options=()
install=
source=('1.patch')
noextract=()
md5sums=('8fffb4423b1fd71ba71304d0641be4c3')

_gitroot="http://git.mwcollect.org/mwcollectd.git/"
_gitname=mwcollect

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  #
  # BUILD HERE
  #
  autoreconf -vi
  patch -p1 -i ../1.patch
  ./configure --prefix=/
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
