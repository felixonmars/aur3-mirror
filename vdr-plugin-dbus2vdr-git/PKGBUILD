# Maintainer: Sebastian Voecking <voeck@mauspack.de
pkgname=vdr-plugin-dbus2vdr-git
pkgver=20120116
pkgrel=2
pkgdesc="Plugin for controlling vdr via DBus as an alternative to SVDRP"
arch=('i686' 'x86_64')
url="https://github.com/flensrocker/vdr-plugin-dbus2vdr"
license=('GPL')
depends=('dbus-core' 'vdr')
makedepends=('git')
provides=('vdr-plugin-dbus2vdr')
conflicts=('vdr-plugin-dbus2vdr')
backup=('etc/dbus-1/system.d/de.tvdr.vdr.conf')
source=('makefile.patch')
md5sums=('8b957dfdee865ee4dd9730b530accf43')

_gitroot=git://github.com/flensrocker/vdr-plugin-dbus2vdr.git
_gitname=vdr-plugin-dbus2vdr

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
  #./autogen.sh
  #./configure --prefix=/usr

  patch -p0 <$startdir/makefile.patch
  install -d -m755 $pkgdir/usr/lib/vdr
  make VDRDIR="/usr/include/vdr" LIBDIR="$pkgdir/usr/lib/vdr" LOCALEDIR="$pkgdir/usr/share/locale" all
  install -D -m755 bin/vdr-dbus-send.sh $pkgdir/usr/bin/vdr-dbus-send.sh
  install -D -m644 etc/de.tvdr.vdr.conf $pkgdir/etc/dbus-1/system.d/de.tvdr.vdr.conf
}

package() {
  cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
