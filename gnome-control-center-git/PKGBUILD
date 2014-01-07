# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-control-center
pkgname=$_pkgname-git
pkgver=3.11.3.r4.g00fbe35
pkgrel=1
pkgdesc="The Control Center for GNOME"
arch=('i686' 'x86_64')
depends=(accountsservice cups-pk-helper "gnome-bluetooth>=3.11.1" "gnome-desktop>=3.9.0" gnome-menus "glib2>=2.37.7"
         "gnome-online-accounts>=3.9.1" gnome-settings-daemon "gsettings-desktop-schemas>=3.9.11" "gtk3>=3.11.1"
         libgtop network-manager-applet sound-theme-freedesktop "upower>=0.99.0" "libpwquality>=1.2.2"
         gnome-color-manager smbclient modemmanager)
makedepends=(git gnome-doc-utils intltool docbook-xsl)
url="http://www.gnome.org"
groups=('gnome')
install=gnome-control-center.install
license=('GPL')
options=('!libtool' '!emptydirs')
conflicts=('gnome-control-center')
replaces=('gnome-control-center')
provides=('gnome-control-center=3.11.3')
source=('git://git.gnome.org/gnome-control-center')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --always | sed -E 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$_pkgname --disable-static --disable-silent-rules

  #https://bugzilla.gnome.org/show_bug.cgi?id=656229
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # Fix a warning
  chown 102:0 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
}
