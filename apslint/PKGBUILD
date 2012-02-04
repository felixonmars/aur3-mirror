# Maintainer: dchusovitin <dchusovitin@gmail.com>
pkgname=apslint
pkgver=1.2
pkgrel=88
pkgdesc="Tool for software vendors to package their SaaS/cloud applications with Application Packaging Standard (APS)"
arch=('any')
url="http://www.apsstandard.org/"
license=('unknown')
depends=(java-runtime)
source=("http://www.apsstandard.org/r/doc/${pkgname}-${pkgver}-${pkgrel}.zip")
sha256sums=('bf0f6b4e86b9a3662ad3b556a22f2114820a59c500d56f4ac9232b7992ff7b87')

package() {
    mkdir -p "$pkgdir"/usr/lib/"$pkgname"
    mkdir -p "$pkgdir"/usr/bin/
    mv "$srcdir"/usr/lib/aps/* "$pkgdir"/usr/lib/"$pkgname"
    cp "$srcdir"/usr/bin/* "$pkgdir"/usr/bin/
    sed -e 's/\/usr\/lib\/aps\//\/usr\/lib\/apslint\//' -i "$pkgdir"/usr/bin/*
}
