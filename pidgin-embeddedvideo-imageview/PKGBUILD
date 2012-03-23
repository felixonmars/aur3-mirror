# Maintainer: peace4all <markspost at rocketmail dot com>
#Original maintainer: felixonmars.
pkgname=pidgin-embeddedvideo-imageview
pkgver=1.1
_rel=2
pkgrel=4
pkgdesc="Watch videos directly into your Pidgin conversation - with imageview support"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pidgin-embeddedvideo/"
license=('GPL')
provides=('pidgin-embeddedvideo')
depends=('pidgin' 'flashplugin')
makedepends=('pidgin' 'glib2' 'libxml2' 'libwebkit' 'curl')
source=(http://geekr.googlecode.com/files/pidgin-embeddedvideo-imageview.tar.gz)

md5sums=('515f05c7e57904dbed53aca1bb97a750')

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install || return 1
}
