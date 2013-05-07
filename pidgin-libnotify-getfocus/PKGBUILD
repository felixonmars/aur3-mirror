# Maintainer: Alejandro Perez <alejandro.perez.mendez@gmail.com>
pkgname=pidgin-libnotify-getfocus
pkgver=0.14
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="pidgin plugin that enables popups when someone logs in or messages you, fixed to grab focus when the notification button is clicked."
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')
depends=('pidgin' 'libnotify')
conflicts=('pidgin-libnotify')
makedepends=('intltool')
optdepends=('notification-daemon')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/gaim-libnotify/pidgin-libnotify-$pkgver.tar.gz language_fixes.patch
        pidgin-libnotify-0.14-libnotify-0.7.patch pidgin-libnotify-showbutton.patch pidgin-libnotify-getfocus.patch)

build() {
  cd "$srcdir/pidgin-libnotify-$pkgver"
  patch -Np1 -i "$srcdir/language_fixes.patch"
  patch -Np0 -i "$srcdir/pidgin-libnotify-0.14-libnotify-0.7.patch"
  patch -Np0 -i "$srcdir/pidgin-libnotify-showbutton.patch"
  patch -Np0 -i "$srcdir/pidgin-libnotify-getfocus.patch"

  ./configure --prefix=/usr --disable-deprecated  --disable-static
  make
}
package() {
  cd "$srcdir/pidgin-libnotify-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('bfb5368b69c02d429b2b17c00a6673c0'
         'e9bdbb3c7faa61f062fc64277457b6c0'
         '05538625f14d9f2c12adae5fa6a1fa26'
         'efe1e86aa1e0bc9f7d20efe7f34ad4a7'
         'e624998744d1c2fb8e2c6be94b04c38a')
