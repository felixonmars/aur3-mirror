pkgname=sum
pkgver=7.3.1
pkgrel=1
pkgdesc="Stifte und Mäuse Bibliotheken für BlueJ"
arch=('any')
url="http://mg-werl.de/sum/"
license=('GPL2')
depends=('bluej')
source=(http://mg-werl.de/sum/SuMMac.zip)
md5sums=('52d2930724cc53d9441ffcf71e09b7e1')

build() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/java/bluej/{userlib,extensions,german/templates/newclass/}
  cp -R SuMMac\ "$pkgver"/Bibs/in\ userlib/* "$pkgdir"/usr/share/java/bluej/userlib/
  cp -R SuMMac\ "$pkgver"/Bibs/in\ extensions/* "$pkgdir"/usr/share/java/bluej/extensions/
  cp -R SuMMac\ "$pkgver"/german/templates/newclass/* "$pkgdir"/usr/share/java/bluej/german/templates/newclass/
  cp -R SuMMac\ "$pkgver"/doc "$pkgdir"/usr/share/java/bluej/
}
