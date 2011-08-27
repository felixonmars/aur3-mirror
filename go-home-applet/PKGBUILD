# Maintainer: michaudg
pkgname=go-home-applet
pkgver=0.2.8
pkgrel=1
pkgdesc="A gnome-panel applet that, when clicked upon, displays the desktop. Used in a netbook-based desktop, the desktop-window will normally be the launcher."
arch=("i686" "x86_64")
url="https://launchpad.net/go-home-applet"
license=('GPL')
groups=(gnome)
depends=('libpanelappletmm' 'gtk2>=2.6' 'gconf' 'gnome-desktop' 'libgnomeui')
makedepends=('intltool')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=(http://launchpad.net/go-home-applet/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('bf7f4aaebb072383d8aa2c110b41bda3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install || return 1
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/usr/etc/gconf/schemas/*.schemas || return 1
}
