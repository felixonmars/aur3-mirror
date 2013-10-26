# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gnome-video-arcade-git
_realname=gnome-video-arcade
pkgver=485.5a49776
pkgrel=1
pkgdesc="GTK3 MAME front-end wich supports both XMAME and SDLMAME(development version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/GnomeVideoArcade"
license=('GPL3')
depends=('dbus' 'gconf' 'gnome-common' 'gnome-user-docs' 'gstreamer0.10-base-plugins' 'gtk-doc' 'libsoup' 'libwnck3' 'sqlite3')
makedepends=('git' 'yelp-tools')
conflicts=(gnome-video-arcade)
install=$_realname.install
source=('git+git://git.gnome.org/gnome-video-arcade'
         $_realname.install)
md5sums=('SKIP'
         '44899d1d03a269b6e6b016907d495e18')

prepare() {
  cd $srcdir/$_realname
  sh autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$_realname
  make
}

package() {
  cd $srcdir/$_realname
  make DESTDIR=$pkgdir install  
}

pkgver() {
  cd $srcdir/$_realname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}