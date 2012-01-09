# Contributor: Corrado Primier  <ilbardo@gmail.com>
pkgname=my190
pkgver=2.0.4
pkgrel=1
pkgdesc="Vodafone 190.it account manager"
arch=('any')
url="http://assistenza.vodafone.it/privati/servizi_web/my_190_per_pc_e_mac"
license=('unknown')
depends=('adobe-air' 'desktop-file-utils')
source=(http://www.assistenza.vodafone.it/content/download/27841/166604/file/My190.air
  'my190' 'my190.desktop')
install=my190.install
md5sums=('b3a69a7911e49ed6820226453095b36d'
         'dd1012eadd69601fdd1b5945ee39e5c6'
         '4ab87a700f4b0777c59d210e7959a8b0')
noextract=('My190.air')

build() {
  cd "$srcdir"

  install -Dm644 "$srcdir/My190.air" "$pkgdir/opt/$pkgname/My190.air"
  install -Dm755 "$srcdir/my190" "$pkgdir/usr/bin/my190"
  install -Dm644 "$srcdir/my190.desktop" "$pkgdir/usr/share/applications/my190.desktop"

  # Install application icon
  unzip -jqo "$srcdir/My190.air" images/logo-header.png -d "$srcdir"
  install -Dm644 "$srcdir/logo-header.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
