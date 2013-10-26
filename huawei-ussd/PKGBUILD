pkgname=huawei-ussd
pkgver=4
pkgrel=1
pkgdesc="USSD request script for huawei (and possibly other 2 ttys) modems"
arch=('any')
url="http://betment-6.livejournal.com/6002.html"
license=('unknown')
depends=('perl-device-gsm' 'perl-text-iconv')
options=(!emptydirs)
source=('huawei-ussd.pl')
md5sums=('7f209c9b4914c92f14b868a5f818be57')

package() {
  install -D -m 0755 $srcdir/huawei-ussd.pl $pkgdir/usr/bin/huawei-ussd
}
