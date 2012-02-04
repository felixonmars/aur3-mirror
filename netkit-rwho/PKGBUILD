# Contributor: Thereidos <admin@therek.net>

pkgname=netkit-rwho
pkgver=0.17
pkgrel=1
pkgdesc="Remote who"
depends=('glibc')
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/"
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/$pkgname-$pkgver.tar.gz $pkgname-$pkgver.patch rwhod.rc)
md5sums=('0f71620d45d472f89134ba0d74242e75' '06e5aff76e509167bc8ce7399ee3a483' \
	'0c38c3c52ea9f2709f350fb9c29c82c6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../$pkgname-$pkgver.patch
  ./configure --prefix=/usr --installroot=$startdir/pkg
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,sbin,man/man1,man/man8} $startdir/pkg/etc/rc.d
  make install
  mkdir -p $startdir/pkg/var/spool/rwho
  install -m755 $startdir/src/rwhod.rc $startdir/pkg/etc/rc.d/rwhod
}

# end of file #
