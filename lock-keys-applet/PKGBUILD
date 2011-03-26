# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=lock-keys-applet
pkgver=1.0
pkgrel=6
pkgdesc="Lock keys applet is a gnome2 applet, that shows the status of the CAPS-, NUM- and SCROLL-Lock keys of your keyboard."
url="http://www.wh-hms.uni-ulm.de/~mfcn/lock-keys-applet/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-panel-bonobo')
makedepends=('intltool' 'gnome-doc-utils')
#source=(http://www.wh-hms.uni-ulm.de/~mfcn/shared/lock-keys/$pkgname-$pkgver.tar.gz)
source=(${pkgname}-${pkgver}.tar.gz)
md5sums=('8dc772d62f0881c8978513d7e69de3db')

build() {
   cd $startdir/src/$pkgname-$pkgver
   #GtkTooltips deprecated in gtk 2.12, it's been replaced with GtkTooltip
   sed -i 's|GtkTooltips |GtkTooltip |g' src/lock-keys-applet.c
   sed -i 's|gtk_tooltips_set_tip;|gtk_tooltip_set_text|g' src/lock-keys-applet.c
   #GTK_SIGNAL_FUNC deprecated in gtk 2.14 it's been replace with G_CALLBACK
   sed -i 's|GTK_SIGNAL_FUNC|G_CALLBACK|g' src/lock-keys-applet.c
   ./configure --prefix=`pkg-config libpanelapplet-2.0 --variable=prefix`
   make || return 1
   make DESTDIR=$startdir/pkg install
}
