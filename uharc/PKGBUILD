# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=uharc
pkgver=0.6b
pkgrel=1
pkgdesc="high compression multimedia archiver"
arch=(any)
url="http://unknown/"
license=('Freeware')
depends=('wine')
noextract=("uharc06b.zip")
source=(uharc 'ftp://ftp.sac.sk/pub/sac/pack/uharc06b.zip')
md5sums=('54270401d798ad508bc93c5b6943c729' '1ebeb57946cfd7e998e5a7be78f2b0bc')

build() {
  mkdir -p "$srcdir/u"
  cd "$srcdir/u/"
  bsdtar xf "$srcdir/uharc06b.zip"
}

package() {
  install -Dm755 "$srcdir/uharc" "$pkgdir/usr/bin/uharc"
  install -dm755 "$pkgdir/usr/share"
  mv "$srcdir/u" "$pkgdir/usr/share/uharc"
}

# vim:set ts=2 sw=2 et: