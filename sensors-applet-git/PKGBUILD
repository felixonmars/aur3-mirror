# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=sensors-applet
pkgname=$_pkgname-git
pkgver=20111113
pkgrel=1
pkgdesc="An applet for the GNOME Panel to display readings from hardware sensors, including CPU temperature, fan speeds and voltage readings under Linux"
arch=('i686' 'x86_64')
url="http://sensors-applet.sourceforge.net/"
license=('GPL')
depends=('gnome-panel>=3.0.0' 'lm_sensors' 'udisks' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool' 'gnome-doc-utils')
provides=('sensors-applet')
conflicts=('sensors-applet')
options=('!libtool')
install=$_pkgname.install

_gitroot="git://sensors-applet.git.sourceforge.net/gitroot/sensors-applet/sensors-applet"
_gitname="sensors-applet"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
               --disable-static --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
