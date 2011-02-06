# Contributor: Tyler Gates <TGates81@gmail.com>

pkgname=snort-sam
_pkgname=snort
pkgver=2.4.5
pkgrel=1
pkgdesc="A lightweight network intrusion detection system"
url="http://www.snort.org"
depends=('libpcap' 'pcre')
backup=('etc/conf.d/snort' 'etc/snort/snort.conf')
provides=('snort')
conflicts=('snort')
source=(http://www.snort.org/dl/current/$_pkgname-$pkgver.tar.gz snort snort.conf.d \
        http://www.snort.org/pub-bin/downloads.cgi/Download/vrt_pr/snortrules-pr-2.4.tar.gz \
	http://www.snortsam.net/files/snort-plugin/snortsam-patch.tar.gz)
md5sums=('108b3c20dcbaf3cdb17ea9203342eaaa' '53284a7996ee41c4c58d13c65d46d776'\
         'a117b68ec3d188e40e117f3197e1db25' '35d9a2486f8c0280bb493aa03c011927'\
         'e37653bb57087b4bc344fd99898064de')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  msg "decompressing snortsam-patch.tar.gz to snort source directory..."
  tar xzvf ../snortsam-patch.tar.gz  || return 1
  msg "patching snort with snortsam support..."
  sh patchsnort.sh $startdir/src/$_pkgname-$pkgver/ || return 1
  msg "running aclocal -I m4..."
  aclocal -I m4 || return 1
  msg "running autoconf..."
  autoconf || return 1
  msg "running autoheader..."
  autoheader || return 1
  msg "running automake --add-missing --copy --foreign..."
  automake --add-missing --copy --foreign || return 1
  msg "starting build..."
  ./configure --prefix=/usr --sysconfdir=/etc/snort --with-libpcap-includes=/usr/include/pcap \
    --without-mysql --without-postgresql --without-oracle --without-odbc
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/{etc/rc.d,etc/snort/rules,var/log/snort}
  install -D -m644 etc/{*.conf*,*.map,generators} $startdir/pkg/etc/snort
  install -D -m644 ../../snort.conf.d $startdir/pkg/etc/conf.d/snort
  install -D -m644 $startdir/src/rules/*.rules $startdir/pkg/etc/snort/rules
  install -D -m755 $startdir/snort $startdir/pkg/etc/rc.d/snort
  sed 's|RULE_PATH ../rules|RULE_PATH /etc/snort/rules|' -i $startdir/pkg/etc/snort/snort.conf
}
