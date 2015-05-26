# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-panel
pkgver=0.3.1
pkgrel=1
pkgdesc='The Defora lightweight panel'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libdesktop' 'defora-player' 'gtk2')
makedepends=('defora-configure')
source=("http://www.defora.org/os/download/download/4338/Panel-${pkgver}.tar.gz")
md5sums=('20ce22c639f5d2c39d92b55316ad10f5')

build() {
  cd "$srcdir/Panel-$pkgver"
  configure
  make LDFLAGS="-ldl `pkg-config --libs gdk-2.0`" PREFIX="/usr"
}

package() {
  cd "$srcdir/Panel-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install

  #avoid a conflict with libavc1394.
  mv "$pkgdir"/usr/bin/{panelctl,panelcontrol}
  sed -i 's/panelctl/panelcontrol/g' \
   "$pkgdir/usr/share/applications/deforaos-panel-settings.desktop" \
   "$pkgdir/usr/share/man/man1/panelctl.1"
  mv "$pkgdir"/usr/share/man/man1/{panelctl,panelcontrol}.1
}
