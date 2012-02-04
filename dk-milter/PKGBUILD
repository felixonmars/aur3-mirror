# Contributor: Yejun Yang ( yejunx AT gmail DOT com )

pkgname='dk-milter'
pkgver=1.0.2
pkgrel=1
pkgdesc="domainkeys signer/verifier"
arch=('i686' 'x86_64')
url="http://dk-milter.sourceforge.net/"
license=('SENDMAIL')
depends=('libmilter' 'postfix>=2.5' 'openssl')
optdepends=('tcsh: gentxt.csh support')
backup=('etc/conf.d/dk-filter.conf')
install=dk-milter.install
source=("http://superb-east.dl.sourceforge.net/sourceforge/dk-milter/$pkgname-$pkgver.tar.gz"
	'dk-filter'
	'dk-filter.conf')
md5sums=('bfb196cce24a94ded06eebd60dfb1eb8'
         'f4173ee7a4ee3e0c662d13167e6b2e75'
         '64da2cde9e06aca2e62398052da5fc0b')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/sbin $pkgdir/usr/bin $pkgdir/usr/man/man8 $pkgdir/etc/dk-milter
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/bin/dk-filter $pkgdir/usr/sbin/dk-filter
  mkdir -p $pkgdir/etc/rc.d $pkgdir/etc/conf.d
  install -m755 $srcdir/dk-filter $pkgdir/etc/rc.d
  install -m644 $srcdir/dk-filter.conf $pkgdir/etc/conf.d
  sed -i 's/512/1024/' dk-filter/gentxt.csh
  install -m755 dk-filter/gentxt.csh $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
