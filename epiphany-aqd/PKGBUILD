# Contributor: Aquila Deus <aquila.deus@gmail.com>

pkgname=epiphany-aqd
pkgver=2.24.3
pkgrel=1
pkgdesc="Epiphany web browser, with patch to quit and save session, open popup and new window in new tab."
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/epiphany/"
license=('GPL')
depends=('xulrunner>=1.9.0.5-2' 'desktop-file-utils' 'enchant>=1.4.2' 'gnome-desktop>=2.24.3' 'iso-codes>=2.0' 'libcanberra' 'libnotify>=0.4.5')
makedepends=('gnome-doc-utils>=0.14.0' 'gnome-python>=2.22.3' 'intltool' 'libnetworkmanager>=0.6.6' 'pkgconfig')
options=('!libtool')
provides=(epiphany=$pkgver)
conflicts=('epiphany')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/epiphany/2.24/epiphany-$pkgver.tar.gz \
        contenthandler.patch \
        ephy-bookmarks-editor.patch \
        ephy-history-window.patch \
        ephy-main.patch \
        ephy-session.patch \
        ephy-shell.patch \
        ephy-window.patch \
        epiphany-ui.patch \
        gtknssdialogs.patch \
        gtknsssecuritywarningdialogs.patch \
        popup-commands.patch)
md5sums=('d1c5565231e194b54a9b35a193f7071c'
         '30a2fcefab233967ece2e990f03e93bc'
         'fcfcaba6442f26fd1d6b3f484b66cb99'
         '3fc534fb3b485b0048ebb77453591594'
         '3e7f09c79603d835229f236150bb730b'
         '2a56c7db1f156cc8dfe4a0efc982d720'
         '15245d550dc124bddb436ea6e6fda4cf'
         'a6962f554e74daf0cdd21292c54e6c2b'
         'cc0aa43aee577f9bfc22bf08069da991'
         'e1994b110d59815a418c4c4c645b0ec1'
         'c4b1b786e000abe4ce0ea4b3a8adeb7e'
         'ddecf898ed6e29c7fecb38785940fc7d')

build() {
  cd $startdir/src/epiphany-$pkgver
  patch -Np0 -i ../contenthandler.patch || return 1
  patch -Np0 -i ../ephy-bookmarks-editor.patch || return 1
  patch -Np0 -i ../ephy-history-window.patch || return 1
  patch -Np0 -i ../ephy-main.patch || return 1
  patch -Np0 -i ../ephy-session.patch || return 1
  patch -Np0 -i ../ephy-shell.patch || return 1
  patch -Np0 -i ../ephy-window.patch || return 1
  patch -Np0 -i ../epiphany-ui.patch || return 1
  patch -Np0 -i ../gtknssdialogs.patch || return 1
  patch -Np0 -i ../gtknsssecuritywarningdialogs.patch || return 1
  patch -Np0 -i ../popup-commands.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-scrollkeeper \
      --enable-python \
      --enable-certificate-manager \
      --enable-dbus \
      --enable-network-manager \
      --enable-spell-checker \
      --with-gecko=libxul-embedding || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" \
    install || return 1

  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/epiphany.schemas" \
    "$pkgdir/etc/gconf/schemas"/*.schemas || return 1
  rm -rf "$pkgdir/etc"
}
