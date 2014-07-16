# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>

pkgname=shareaza
pkgver=2.7.5.0
pkgrel=2
pkgdesc="Shareaza is a peer-to-peer file sharing client which supports gnutella, Gnutella2, eDonkey (emule), BitTorrent, FTP, HTTP and HTTPS. It is available in 30 languages."
arch=(any)
url="http://shareaza.sourceforge.net/"
license=('GPL')
depends=(wine)
noextract=("shareaza.v$pkgver.zip")
source=(shareaza shareaza.desktop shareaza80.xpm "shareaza.v$pkgver.zip::https://cdn.anonfiles.com/1405432517151.zip")
md5sums=('eef60e70412c08ff3496626bc186ccfb' '7196278d2c3eef0a5bb8aadd16e2a48f' 'c0e84cbe64bcd4f06099e35355ea60c8' 'e3aa50283c7c4b597d26805d73527041')

build() {
  mkdir -p "$srcdir/s"
  cd "$srcdir/s/"
  bsdtar xf "$srcdir/shareaza.v$pkgver.zip"
}

package() {
  install -Dm755 "$srcdir/shareaza" "$pkgdir/usr/bin/shareaza"
  install -dm755 "$pkgdir/usr/share"
  mv "$srcdir/s/shareaza" "$pkgdir/usr/share/shareaza"
  find "$pkgdir/usr/share/shareaza/" -type f -exec chmod 644 "{}" \;
  install -dm755 "$pkgdir/usr/share/applications"
  install -D -m 644 shareaza.desktop "${pkgdir}/usr/share/applications/"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -D -m 644 shareaza80.xpm "${pkgdir}/usr/share/pixmaps/"
}

# vim:set ts=2 sw=2 et: