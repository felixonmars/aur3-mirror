#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=viper
pkgver=1.0
pkgrel=1
pkgdesc="Stable version of Viper the Binary Analysis Framework"
arch=("any")
url=("https://github.com/botherder/viper")
license=("GPLv3")
depends=("python2-sqlalchemy" "python2-prettytable" "python2-magic" "python2-pydeep" "ssdeep" "python2-ssdeep" "python2-beautifulsoup4" "python2-pefile" "python2-crypto" "python2-olefileio") 
makedepends=("gcc" "python2")
source=("http://github.com/botherder/viper/archive/1.0.tar.gz"
        "viper.install")
md5sums=("5c1fb52839d6d3a2140f1180720d0146"
         "a5f9fd9929d10fe09ddd9d6604105de7")
install="viper.install"
package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/opt/viper/"
  mv * "$pkgdir/opt/viper/"
}
