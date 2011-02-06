pkgname=ezbounce
pkgver=1.04c
pkgrel=1
pkgdesc="A highly configurable IRC proxy"
url="http://druglord.freelsd.org/ezbounce"
depends=(gcc openssl)
md5sums=(d3cc3bbd162a0ba7d22a0a9fc629bfd6)
source=(http://druglord.freelsd.org/ezbounce/files/ezbounce-1.04c.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-ssl --sysconfdir=/etc
  make || return 1
  install -d $startdir/pkg/usr/bin
  install -m 755 ezbounce $startdir/pkg/usr/bin
  install -d $startdir/pkg/etc
  install -m 644 sample.conf $startdir/pkg/etc/ezbounce.conf
  sed -i 's/set logfile ezbounce.log/set logfile \/var\/log\/ezbounce\/ezbounce.log/g' $startdir/pkg/etc/ezbounce.conf
  sed -i 's/set log-dir logs/set log-dir \/var\/log\/ezbounce/g' $startdir/pkg/etc/ezbounce.conf
  ./misc/make_key.sh rsa ezbounce
  install -m 644 ezb-rsa.pem $startdir/pkg/etc
  sed -i 's/# set cert-file ezb.cert/set cert-file \/etc\/ezb-rsa.pem/g' $startdir/pkg/etc/ezbounce.conf
}
