# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
pkgname=freeride-bin
pkgver=0.9.6
pkgrel=3
pkgdesc="Cross-platform IDE for the Ruby programming language"
arch=('i686')
url="http://freeride.rubyforge.org/"
license=('GPL' 'RUBY')
source=(http://rubyforge.org/frs/download.php/10933/freeride-linux-installer-$pkgver.sh
        http://koon.fr/~gcarrier/freeride.png
        freeride.sh
        freeride.desktop
        headless_install.patch)
md5sums=('b37681e7219d5ed02a4a18a8ff7e4dc0'
         '31f2fb8434a3a361736bbec002246c9e'
         'db3b795ed94ee9a308459ee8f761f35f'
         '02d6c55db888c4085c4fb27eb17981f0'
         'f0490741e5b08293504d5ab255253647')
build() {
  cd "$srcdir"
  patch freeride-linux-installer-0.9.6.sh < headless_install.patch
  sh freeride-linux-installer-0.9.6.sh "$pkgdir/usr/local"
  install -Dm755 freeride.sh "$pkgdir/usr/bin/freeride"
  install -D freeride.png "$pkgdir/usr/share/pixmaps/freeride.png"
  install -D freeride.desktop "$pkgdir/usr/share/applications/freeride.desktop"
}
