# Maintainer: wombalton <wombalton@web.de>
# Package created by wombalton
# Original by Steffen Brüntjen (eurkey@steffen.bruentjen.de), http://www.eurkey.steffen.bruentjen.eu

pkgname=xkb-eurkey
pkgver=1.1.3
pkgrel=2
pkgdesc="An alternative xkb keyboard layout which supports all characters used in European languages."
arch=('any')
url="http://wombalton.ddns.net/eurkey.html"
license=('GPL3')
depends=('')
makedepends=('')
changelog="changelog"
source=("http://wombalton.ddns.net/EurKEY-1.1.3.tar.gz")
md5sums=('4835dd7ee68e85d7b83d4cda0d2ca538')

build() {
  cd "$srcdir"

    tar xvf EurKEY-$pkgver.tar.gz
}

package() {
  cd "$srcdir"

  install -D -m 644 eurkey ${pkgdir}/usr/share/X11/xkb/symbols/eurkey

  install -D -m 644 README ${pkgdir}/usr/share/doc/eurkey/README
  install -D -m 644 eurkey_Print.pdf ${pkgdir}/usr/share/doc/eurkey/eurkey_Print.pdf
  install -D -m 644 eurkey_Print.svg ${pkgdir}/usr/share/doc/eurkey/eurkey_Print.svg
}

post_install() {
    note "You can find a printable layout overview in /usr/share/doc/eurkey/"
}

