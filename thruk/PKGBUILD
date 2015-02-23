# Maintainer: Marius Zukaitis <banditsan at aur.archlinux.org>

_pkgname=Thruk
pkgname=thruk
_pkgver=1.86-4
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multibackend monitoring webinterface for Naemon, Nagios, Icinga and Shinken"
arch=('any')
url="http://thruk.org"
license=('GPL2')
depends=('perl' 'apache' 'mod_fcgid' 'perl-file-copy-recursive'
  'perl-json-xs' 'perl-date-calc' 'perl-file-slurp' 'perl-config-general'
  'perl-catalyst-runtime' 'perl-gd' 'perl-log-log4perl' 'perl-config-any'
  'perl-catalyst-plugin-redirect' 'perl-catalyst-plugin-customerrormessage'
  'perl-catalyst-plugin-authorization-roles' 'perl-catalyst-view-tt'
  'perl-catalyst-view-json' 'perl-catalyst-view-excel-template-plus'
  'perl-data-page' 'perl-mime-lite' 'perl-catalyst-action-renderview'
  'perl-log-dispatch' 'perl-fcgi')
optdepends=('naemon-livestatus')
backup=('etc/thruk/cgi.cfg' 'etc/thruk/htpasswd'
  'etc/thruk/log4perl.conf' 'etc/thruk/menu_local.conf'
  'etc/thruk/naglint.conf' 'etc/httpd/conf/extra/thruk.conf'
  'etc/thruk/thruk_local.conf' 'etc/thruk/thruk.conf')
install=$pkgname.install
source=(http://download.thruk.org/pkg/v$_pkgver/src/$_pkgname-$_pkgver.tar.gz)
md5sums=('6ee10e7fd87d8a97247670c433121cf1')

prepare() {
  cd "$srcdir"/$_pkgname-$_pkgver

  # Work around bug https://rt.cpan.org/Public/Bug/Display.html?id=87998
  sed -i '/Compress/d' lib/Thruk.pm

  # Fix pid file location
  sed -i 's.var/cache/thruk.var/lib/thruk.' support/apache_fcgid.conf
}

build() {
  cd "$srcdir"/$_pkgname-$_pkgver

  ./configure --prefix=/usr \
    --exec-prefix=/bin \
    --bindir=/usr/bin \
    --sysconfdir=/etc/$pkgname \
    --localstatedir=/var/lib/thruk \
    --libdir=/var/lib \
    --datadir=/usr/share/$pkgname \
    --mandir=/usr/share/man \
    --with-initdir=/etc/thruk \
    --with-logdir=/var/log/thruk \
    --with-checkresultdir=/var/cache/naemon/checkresults \
    --with-tempdir=/var/lib/thruk \
    --with-logrotatedir=/etc/logrotate.d

  make
}

package() {
  cd "$srcdir"/$_pkgname-$_pkgver

  make DESTDIR="$pkgdir"/ install

  install -Dm644 support/apache_fcgid.conf "$pkgdir"/etc/httpd/conf/extra/$pkgname.conf
}
