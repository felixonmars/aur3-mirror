# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>

pkgname=transmission-remote-gtk2
_pkgname=transmission-remote-gtk
pkgver=1.1.1
pkgrel=2
pkgdesc="GTK application for remote management of the Transmission BitTorrent client via its RPC interface."
arch=('i686' 'x86_64')
url="http://code.google.com/p/transmission-remote-gtk/"
license=('GPL2')
depends=('json-glib' 'curl' 'libproxy' 'libnotify' 'gtk2' 'geoip' 'desktop-file-utils')
makedepends=('intltool')
install="${pkgname}.install"
options=('!libtool')
conflicts=("transmission-remote-gtk")
source=("http://transmission-remote-gtk.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz"
  	"torrent-cell-renderer_longlong_issue-259.diff"
	"add-dialog_present_issue-260.diff")
md5sums=('61c44578ad059d8ba4758806805c164e'
         '003dffcd7d0a7247739400e16a72b4ed'
         '17f4326108d5b8f02e23af69d16a91a0')

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p0 -i $srcdir/torrent-cell-renderer_longlong_issue-259.diff
  patch -p0 -i $srcdir/add-dialog_present_issue-260.diff
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk2
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
