# Maintainer: Robert Marmorstein <rmmarm AT sdf DOT lonestar DOT org>
pkgname=w3c-validator
_pkgname=validator
pkgver=1.3
pkgrel=2
pkgdesc="Web application for checking W3C conformance without relying on the w3.org server"
arch=('any')
url="http://validator.w3.org"
license=('W3C')
depends=('mod_perl' 'perl' 'perl-config-general>=2.32' 'perl-encode-hanextra'  
	 'perl-html-encoding>=0.52' 'perl-html-template>=2.60' 'perl-json>=2.00' 
         'perl-libwww' 'perl-net-ip' 'perl-sgml-parser-opensp>=0.991' 'perl-xml-libxml>=1.0703')
optdepends=('perl-tidy: Optionally generate a tidied version of submissions')
backup=('etc/w3c/validator.conf' 'etc/w3c/charset.cfg' 'etc/w3c/tidy.conf' 'etc/w3c/types.conf' 'etc/httpd/conf/extra/w3c.conf')
install=w3c-validator.install
source=($url/$_pkgname.tar.gz $url/sgml-lib.tar.gz)
md5sums=('8078d4d3f344f72991ef4745984f6e65'
         '9826afc2cce56a25a971fc793ef93ff1')

package() {
	mkdir -p $pkgdir/usr/share/$pkgname/validator
	cd "$srcdir/$_pkgname-1.1"
	cp -r htdocs $pkgdir/usr/share/$pkgname/validator
	cd "$srcdir/$_pkgname-$pkgver"
	cp -r htdocs share httpd/cgi-bin $pkgdir/usr/share/$pkgname/validator
	sed -i -e "s:/usr/local:/usr/share/$pkgname:g" $pkgdir/usr/share/$pkgname/validator/cgi-bin/check

	# Use /etc/w3c instead of /etc/w3c-validator to better match w3.org documentation
	mkdir -p $pkgdir/etc/w3c
	cp $srcdir/$_pkgname-$pkgver/htdocs/config/* $pkgdir/etc/w3c
	mkdir -p $pkgdir/etc/httpd/conf/extra
	cp $srcdir/$_pkgname-$pkgver/httpd/conf/httpd.conf $pkgdir/etc/httpd/conf/extra/w3c.conf
	sed -i -e "s:/usr/local:/usr/share/$pkgname:g" $pkgdir/etc/httpd/conf/extra/w3c.conf
	sed -i -e 's:Allow Private IPs = no:Allow Private IPs = yes:g' $pkgdir/etc/w3c/validator.conf
}

