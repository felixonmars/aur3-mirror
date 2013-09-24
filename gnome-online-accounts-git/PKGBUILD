# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-online-accounts
pkgname=$_pkgname-git
pkgver=3.9.92.4.gb012b64
pkgrel=1
pkgdesc="GNOME service to access online accounts"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=('GPL')
depends=('webkitgtk' 'json-glib' 'libnotify' 'rest' 'hicolor-icon-theme' 'libsecret' 'libxml2')
makedepends=('intltool' 'libxslt' 'gobject-introspection' 'docbook-xsl' 'gnome-common')
options=(!libtool)
install=$_pkgname.install
replaces=('gnome-online-accounts')
provides=('gnome-online-accounts' 'gnome-online-accounts=3.9.92')
conflicts=('gnome-online-accounts')
source=('git://git.gnome.org/gnome-online-accounts#branch=gnome-3-10')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --libexec=/usr/lib/gnome-online-accounts \
    --enable-kerberos --enable-yahoo --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
