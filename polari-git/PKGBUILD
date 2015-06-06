# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=polari
pkgname=$_pkgname-git
pkgver=3.17.1.4.gd465a54
_realver=3.17.1
pkgrel=1
pkgdesc="An IRC Client for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Polari"
license=('GPL2')
groups=('gnome')
depends=("glib2>=2.43.4" 'gjs' "gtk3>=3.9.12" 'telepathy-glib' 'telepathy-idle' 'gnome-icon-theme-symbolic'
	 'telepathy-mission-control' 'telepathy-logger')
makedepends=('git' 'intltool' 'gobject-introspection' 'gnome-common' "appstream-glib")
options=('!libtool')
conflicts=('polari')
replaces=('polari')
provides=("polari=$_realver")
install=polari.install
source=('git://git.gnome.org/polari'
        '0009-chatView-Don-t-align-the-status-message-to-right.patch'
        '0001-Revert-mainWindow-Try-harder-to-keep-focus-on-the-ma.patch')
sha256sums=('SKIP'
            '66df66d736d20b404c12678370e7b249a7ca18b637f6b99814e614a538d242e3'
            '201f6531c10168de54c18567af37b17b2e07243f034396bde077e02eb7fad5b6')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # patch -Np1 -i "$srcdir/0009-chatView-Don-t-align-the-status-message-to-right.patch"
  # patch -Np1 -i "$srcdir/0001-Revert-mainWindow-Try-harder-to-keep-focus-on-the-ma.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
