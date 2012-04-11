# Maintainer: joseph28cb

pkgname=fake-speedtest
pkgver=20111031
pkgrel=1
pkgdesc="Fake speedtest.net results"
arch=('any')
url="https://github.com/gray/dotfiles/blob/master/bin/fake-speedtest.pl"
license=('PerlArtistic')
depends=('perl' 'perl-geo-distance' 'perl-http-date' 'perl-http-message' 'perl-libwww' 'perl-xml-libxml')
source=(${url/blob/raw})
md5sums=('c0d65da5d6c836921d4fa8090c428dc1')

package() {
  install -Dm755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
}
