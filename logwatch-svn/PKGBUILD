# Maintainer: Lance Chen <cyen0312+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=logwatch
pkgname=${_pkgname}-svn
pkgver=167
pkgrel=1
pkgdesc="Logwatch is a customizable log analysis system."
arch=('any')
url="http://www.logwatch.org/"
license=('custom')
depends=('perl' 'cron')
optdepends=('perl-date-manip: human readable dates')
makedepends=('subversion')
provides=('logwatch')
conflicts=('logwatch')
backup=(etc/logwatch/conf/logwatch.conf
        etc/logwatch/conf/ignore.conf
        etc/logwatch/conf/override.conf)
source=('logwatch::svn://svn.code.sf.net/p/logwatch/code/')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  svnversion | tr -d [A-z]
}

package() {
  cd "$srcdir/$_pkgname"

  install -m 0755 -d $pkgdir/usr/share/logwatch
  install -m 0755 -d $pkgdir/usr/share/logwatch/dist.conf
  install -m 0755 -d $pkgdir/usr/share/logwatch/dist.conf/logfiles
  install -m 0755 -d $pkgdir/usr/share/logwatch/dist.conf/services
  install -m 0755 -d $pkgdir/usr/share/logwatch/default.conf
  install -m 0755 -d $pkgdir/usr/share/logwatch/default.conf/logfiles
  install -m 0755 -d $pkgdir/usr/share/logwatch/default.conf/services
  install -m 0755 -d $pkgdir/usr/share/logwatch/default.conf/html
  install -m 0755 -d $pkgdir/usr/share/logwatch/scripts
  install -m 0755 -d $pkgdir/usr/share/logwatch/scripts/logfiles
  install -m 0755 -d $pkgdir/usr/share/logwatch/scripts/services
  install -m 0755 -d $pkgdir/usr/share/logwatch/scripts/shared
  install -m 0755 -d $pkgdir/usr/share/logwatch/lib
  
  install -m 0644 README $pkgdir/usr/share/logwatch/README
  install -m 0644 HOWTO-Customize-LogWatch $pkgdir/usr/share/logwatch/HOWTO-Customize-LogWatch
  install -m 0644 conf/*.conf $pkgdir/usr/share/logwatch/default.conf
  install -m 0644 conf/logfiles/* $pkgdir/usr/share/logwatch/default.conf/logfiles
  install -m 0644 conf/services/* $pkgdir/usr/share/logwatch/default.conf/services
  install -m 0644 conf/html/* $pkgdir/usr/share/logwatch/default.conf/html
  install -m 0755 scripts/logwatch.pl $pkgdir/usr/share/logwatch/scripts/logwatch.pl
  for i in scripts/logfiles/* ; do
    if [ `ls $i | grep -v CVS | wc -l` -ne 0 ] ; then
    install -m 0755 -d $pkgdir/usr/share/logwatch/$i
    install -m 0644 $i/* $pkgdir/usr/share/logwatch/$i
    fi
  done
  install -m 0644 scripts/shared/* $pkgdir/usr/share/logwatch/scripts/shared
  install -m 0644 scripts/services/* $pkgdir/usr/share/logwatch/scripts/services
  install -m 0644 lib/* $pkgdir/usr/share/logwatch/lib
  
  install -m 0755 -d $pkgdir/etc/logwatch
  install -m 0755 -d $pkgdir/etc/logwatch/scripts
  install -m 0755 -d $pkgdir/etc/logwatch/conf
  install -m 0755 -d $pkgdir/etc/logwatch/conf/logfiles
  install -m 0755 -d $pkgdir/etc/logwatch/conf/services
  install -m 0755 -d $pkgdir/etc/logwatch/conf/html
  
  touch $pkgdir/etc/logwatch/conf/logwatch.conf
  touch $pkgdir/etc/logwatch/conf/ignore.conf
  touch $pkgdir/etc/logwatch/conf/override.conf
  
  install -m 0755 -d $pkgdir/usr/share/man/man8/
  install -m 0644 logwatch.8 $pkgdir/usr/share/man/man8/
  
  install -m 0755 -d $pkgdir/etc/cron.daily/
  install -m 0755 -d $pkgdir/usr/bin/
  ln -s /usr/share/logwatch/scripts/logwatch.pl $pkgdir/usr/bin/logwatch
  ln -s /usr/share/logwatch/scripts/logwatch.pl $pkgdir/etc/cron.daily/0logwatch
  
  install -m 0755 -d $pkgdir/var/cache/logwatch
  
  install -m 0755 -d $pkgdir/usr/share/licenses/$pkgname/
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
