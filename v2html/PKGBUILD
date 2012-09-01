#Maintainer: Roman Lapin <lampus.lapin@gmail.com>

pkgname=v2html
pkgver=7.30.1.3
pkgrel=1
pkgdesc="Verilog to HTML converter"
arch=('any')
url="http://www.burbleland.com/v2html/"
license=('custom')
depends=('perl')
source=("http://www.burbleland.com/v2html/${pkgname}.tar.gz")
md5sums=('dca81876da79d503e608742c00bfcefd')
sha1sums=('43e2bd48d0bc6ba42e68d98473a6b009789c24e1')

package() {
  cd $srcdir/
  install -D -m0755 $srcdir/v2html $pkgdir/usr/bin/v2html
  install -D -m0644 LICENCE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0644 v2html.1 "${pkgdir}/usr/share/man/man1/v2html.1"
}

# vim:set ts=2 sw=2 et:
