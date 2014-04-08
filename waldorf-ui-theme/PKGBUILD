# Maintainer: localizator <localizator at ukr dot net>
pkgname=waldorf-ui-theme
pkgver=0.07
pkgrel=1
pkgdesc="Default GTK+ and Openbox themes for CrunchBang Waldorf."
arch=('any')
url="http://crunchbang.org/"
license=('custom:WTFPL')
depends=('gtk-engine-murrine')

source=("http://packages.crunchbang.org/waldorf/pool/main/${pkgname}_$pkgver.tar.gz")

package() {
  cd "$srcdir"/$pkgname-$pkgver/waldorf
  mkdir -p "$pkgdir"/usr/share/themes/waldorf
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp ../debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/
  cp -rt "$pkgdir"/usr/share/themes/waldorf *
}

md5sums=('d74c72a7ed0761aaa1a1672fdc642e7a')
