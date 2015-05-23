# Maintainer: Lara Maia <lara@craft.net.br>
# Contributer: Renan Birck <renan.ee.ufsm (AT) gmail.com>
# Contributer: Lucas Salies Brum <lucas@archlinux.com.br>

pkgname=fortune-mod-br
pkgver=1.0
_pkgver=20080530
pkgrel=2
epoch=2
pkgdesc="Fortunes Cookies in Brazilian Portuguese"
url="https://packages.debian.org/sid/fortunes-br" 
depends=('fortune-mod')
groups=('fortune-mods')
conflicts=('fortunes-br')
source=(http://http.debian.net/debian/pool/main/f/fortunes-br/fortunes-br_$_pkgver.tar.gz)
arch=('any')
license=('GPL')
md5sums=('1099658c85574e0f4c09007ca3731b02')

package() {
  cd fortunes-br-$_pkgver

  strfile brasil brasil.dat

  install -Dm644 brasil     "$pkgdir"/usr/share/fortune/brasil
  install -Dm644 brasil.dat "$pkgdir"/usr/share/fortune/brasil.dat

}
