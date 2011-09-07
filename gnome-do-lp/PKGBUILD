# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Master_D <matze_holz@web.de>
pkgname=gnome-do-lp
_realname=gnome-do
pkgver=0.8.5
pkgrel=1
pkgdesc="A launcher application for gnome (latest LP-Version)"
arch=(i686 x86_64)
url="https://launchpad.net/do"
license=('GPL3')
depends=('desktop-file-utils' 'gnome-desktop-sharp' 'gnome-keyring-sharp' \
         'gtk2' 'mono-addins' 'hicolor-icon-theme' 'ndesk-dbus-glib' \
         'notify-sharp-svn' 'xdg-utils')
makedepends=('intltool' 'ca-certificates')
provides=(${_realname})
conflicts=(${_realname})
options=('!libtool')
install=$pkgname.install
source=(http://launchpad.net/do/trunk/$pkgver/+download/${_realname}-$pkgver.tar.gz)
md5sums=('71e0e653021f895f151a6f46a97f75ba')

build() {
  cd $srcdir/${_realname}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd $srcdir/${_realname}-$pkgver
  make DESTDIR=$pkgdir install
  
  mkdir -p "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/$_realname.schemas \
                      $pkgdir/etc/gconf/schemas/*.schemas
  rm -f $pkgdir/etc/gconf/schemas/*.schemas

  rm -rf $pkgdir/usr/lib/gnome-do/*.mdb
}