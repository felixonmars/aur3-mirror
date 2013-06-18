# Maintainer: Ner0

pkgname=elementary-gtk-theme
pkgver=3.4
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL2')
groups=('pantheon')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
optdepends=('elementary-icons: the elementary icon theme [AUR]')
conflicts=('egtk-bzr')
options=('!strip')
source=("https://launchpad.net/egtk/3.x/3.4/+download/elementary.tar.gz")
noextract=('elementary.tar.gz')
md5sums=('207f1348e9af91ae361d801846bf7820')

package () {
  install -dm755 "$pkgdir/usr/share/themes/"

  tar --no-same-owner -xf "$srcdir/elementary.tar.gz" -C "$pkgdir/usr/share/themes/"
  rm -rf "$pkgdir/usr/share/themes/elementary/.bzr"
}
