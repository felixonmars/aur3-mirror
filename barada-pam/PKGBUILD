# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

pkgname=barada-pam
pkgver=0.5.3
pkgrel=1
pkgdesc="barada PAM module is designed to provide two-factor authentication"
arch=("any")
url="http://barada.sourceforge.net"
license=("GPL3")
depends=("boost")
source=("http://sourceforge.net/projects/barada/files/barada-pam/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make 
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

md5sums=("6d9ed61f780ae12ffdfe74e21dc3da5f")
