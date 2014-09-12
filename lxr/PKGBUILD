# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

pkgname=lxr
pkgver=2.0.2
pkgrel=1
pkgdesc="general purpose source code indexer and cross-referencer"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lxr/"
license=('GPL2')
makedepends=(ctags perl-dbi perl-file-mmagic swish-e)
optdepends=('apache: Webserver'
        'nginx: Webserver'
        'lighttpd: Webserver'
        'mod_perl'
        'perl-dbd-mysql: mariadb/mysql support'
        'perl-dbd-sqlite: sqlite support'
        'perl-dbd-pg: postgresqql support'
        'perl-file-mmagic' 'swish-e: Freetext search')
provides=('lxr')
conflicts=('lxr-cvs')
backup=('etc/lxr/lxr.conf')
options=(emptydirs)
install=lxr.install
source=(http://downloads.sourceforge.net/project/lxr/stable/$pkgname-$pkgver.tgz
        httpd.lxr.conf
        lxr.conf)
md5sums=('f69d7fa87b9dc30e4400a4d0cfdf6296'
         '5a4fcef7e6887bdd97499e99b2c498c8'
         '742f7f8d597103fff7c5a3039cf51034')


package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/etc/httpd/conf/extra/
  cp $srcdir/httpd.lxr.conf $pkgdir/etc/httpd/conf/extra/lxr.conf

  mkdir -p $pkgdir/etc/lxr
  cp $srcdir/lxr.conf swish-e.conf $pkgdir/etc/lxr/

  mkdir -p $pkgdir/usr/bin/vendor_perl
  cp genxref $pkgdir/usr/bin/vendor_perl

  mkdir -p $pkgdir/usr/share/doc/lxr
  cp BUGS ChangeLog CHANGES CREDITS.txt HACKING INSTALL RELEASING $pkgdir/usr/share/doc/lxr

  mkdir -p $pkgdir/usr/share/lxr/templates
  cp initdb-* $pkgdir/usr/share/lxr
  cp templates/{*.html,*.css,*.png} $pkgdir/usr/share/lxr/templates/

  mkdir -p $pkgdir/usr/share/perl5/vendor_perl
  cp -r lib/LXR $pkgdir/usr/share/perl5/vendor_perl/
  cp Local.pm LXRversion.pm $pkgdir/usr/share/perl5/vendor_perl/LXR/

  mkdir -p $pkgdir/usr/lib/lxr/cgi-bin
  cp diff ident search source $pkgdir/usr/lib/lxr/cgi-bin
  ln -sf /usr/share/lxr/templates/ $pkgdir/usr/lib/lxr/cgi-bin/templates
}
