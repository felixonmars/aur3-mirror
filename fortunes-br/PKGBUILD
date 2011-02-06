# Contributer: Renan Birck <renan.ee.ufsm (AT) gmail.com>

pkgname=fortunes-br
pkgver=20080530
pkgrel=1
pkgdesc="Fortune Cookies in Brazilian Portuguese, from the Debian project"
url="http://ftp.br.debian.org/debian/pool/main/f/fortunes-br/fortunes-br_20080530.tar.gz" 
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.br.debian.org/debian/pool/main/f/fortunes-br/${pkgname}_$pkgver.tar.gz)
arch=('any')
license=('GPL')
md5sums=('1099658c85574e0f4c09007ca3731b02')

build() {
	
  cd $srcdir/$pkgname-$pkgver

  strfile brasil brasil.dat

  install -D -m644 brasil $startdir/pkg/usr/share/fortune/brasil
  install -D -m644 brasil.dat $startdir/pkg/usr/share/fortune/brasil.dat
}
# vim: set ft=sh ts=2 et:
