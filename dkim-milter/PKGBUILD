# Contributor: Yejun Yang ( yejunx AT gmail DOT com )

pkgname='dkim-milter'
pkgver=2.8.3
pkgrel=1
pkgdesc="dkim-milter consists of two parts: A milter-based application (dkim-filter) which plugs in to Sendmail to provide DomainKeys Identified Mail service, and a library (libdkim) which can be used to build DKIM-compliant applications or MTAs."
arch=('i686' 'x86_64')
url="http://dkim-milter.sourceforge.net/"
license=('SENDMAIL')
depends=('libmilter' 'postfix>=2.5' 'openssl')
backup=('etc/conf.d/dkim-filter.conf'
	'etc/dkim/dkim.conf')
install=dkim-milter.install
source=("http://downloads.sourceforge.net/project/dkim-milter/DKIM%20Milter/$pkgver/$pkgname-$pkgver.tar.gz"
	'dkim'
	'dkim-filter.conf'
	'dkim.conf')

md5sums=('d2043c269f1720cc095a9b4f163cf3df'
         '98d691d2ee0a354b3e43b0b93b6a7881'
         'b52ba8b25a4dcb06615109c5216ac3eb'
         '0ded824bbb96d2e7745571cdace63d4b')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/sbin $pkgdir/usr/bin $pkgdir/usr/man/man5 $pkgdir/usr/man/man8 $pkgdir/etc/dkim
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  mkdir -p $pkgdir/etc/rc.d $pkgdir/etc/conf.d
  install -m755 $srcdir/dkim $pkgdir/etc/rc.d
  install -m644 $srcdir/dkim-filter.conf $pkgdir/etc/conf.d
  install -m644 $srcdir/dkim.conf $pkgdir/etc/dkim
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
