#Maintainer: nixalot <nixalot at nixalot dot com>
pkgname=aursearch
pkgver=1.1
pkgrel=1
pkgdesc="Search the AUR from the shell"
arch=(any)
license=(GPL3)
url="https://github.com/nixalot/$pkgname"
depends=('python' 'python-requests')
source=(
  ${pkgname}-${pkgver}.tar.gz::https://github.com/nixalot/aursearch/archive/1.1.tar.gz
)

md5sums=('eb5bdd111f589580a7e95d7ce052ff88')
sha1sums=('ac43460754c4934197c87c50189950e290669ed6')
sha256sums=('ca211d2f532b819499d9518567d8e39e5b38fcc9db90d22994f0c93f53528fd7')
sha384sums=('74124914953c7daff0e6b8b92ce30792da5947c53ee8be9119e3a589c3d3a22209490b064c2387dfc5b3593ac19412d9')
sha512sums=('0842d5d70b44925106ca8695bfd15496b591b7f1566d99c8b324d03463fc9acf005a4bec576b66eed674d417abee776732542be3bcda70352ddf4b102237b5e3')

package ()
{
  install -D -m755 "$srcdir/$pkgname-$pkgver/${pkgname}.py" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
