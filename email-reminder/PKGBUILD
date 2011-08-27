# $Id:$
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=email-reminder
pkgver=0.7.3
pkgrel=2
pkgdesc="Send event reminders by email"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.email-reminder.org.nz/"
install=email-reminder.install
depends=('perl>=5.10.0' 'perl-date-manip' 'perl-email-valid' 'perl-xml-dom' 'cron' 'gtk2-perl')
makedepends=('shadow')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz email-reminder.sh)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i "s#usr/bin/send-reminders#usr/bin/perlbin/vendor/send-reminders#g" $srcdir/$pkgname-$pkgver/email-reminder-editor || return 1
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make DESTDIR=$pkgdir install || return 1
  install -D -m755 $srcdir/email-reminder.sh $pkgdir/etc/cron.daily/email-reminder.sh || return 1
  install -D -m644 $srcdir/$pkgname-$pkgver/examples/email-reminders $pkgdir/usr/share/doc/email-reminder/email-reminders || return 1
  install -D -m644 $srcdir/$pkgname-$pkgver/examples/email-reminder.conf $pkgdir/usr/share/doc/email-reminder/email-reminder.conf || return 1
  mkdir -p $pkgdir/var/spool/email-reminder
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
md5sums=('515edf579f07ce33ae338330c67a216a'
         '3f9946ddc64d63f78b2f5c22dc730136')
