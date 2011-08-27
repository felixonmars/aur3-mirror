# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=bkhive
pkgver=1.1.1
pkgrel=2
pkgdesc="Program for dumping the syskey bootkey from a Windows NT/2K/XP system hive"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ophcrack"
license=('GPL')
depends=('glibc')
makedepends=('make')
replaces=('bkhive2')
conflicts=('bkhive2')
source=(http://downloads.sourceforge.net/ophcrack/$pkgname-$pkgver.tar.gz \
	syskey.txt)
md5sums=('bb5e076f3051c60331a7831b6c11719d' '8987a02d580924ac9c1da7196c083c05')

build() {
  cd $pkgname-$pkgver

  make CFLAGS="${CFLAGS}" || return 1

  install -Dm755 bkhive "$pkgdir"/usr/bin/bkhive
  install -Dm644 bkhive.1 "$pkgdir"/usr/share/man/man1/bkhive.1

  install -Dm644 ../syskey.txt "$pkgdir"/usr/share/bkhive/syskey.txt
}
