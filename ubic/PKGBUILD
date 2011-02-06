# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=ubic
pkgver=0.7
pkgrel=2
pkgdesc="The Useless Bash IRC Client"
arch=('i686' 'x86_64' 'any')
url="http://calimeroteknik.free.fr/ubic"
license=('WTFPL')
depends=('bash' 'coreutils' 'sed')
source=(http://calimeroteknik.free.fr/ubic/src/${pkgname}-${pkgver})
md5sums=('3589e8afbe25da2e28cc87beb6ded7ea')

build() {
  cd "$srcdir"
  install -D ubic-$pkgver ${pkgdir}/usr/bin/ubic
}
