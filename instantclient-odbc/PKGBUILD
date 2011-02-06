# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Maintainer: xduugu
pkgname=instantclient-odbc
pkgver=11.2.0.1
pkgrel=3
pkgdesc="Additional libraries for enabling ODBC applications with Instant Client"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technology/tech/oci/instantclient/"
license=('custom:OTN')
depends=("instantclient-basic=$pkgver")
#
# grab the source from
# i686  : http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxsoft.html
# x86_64: http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxx86_64soft.html
#
source=($pkgname-linux32-$pkgver.zip LICENSE)
md5sums=('55a09a9ba803dbc3f9d053a9cba8af2d'
         '2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('d33b1c4fa39e14b862ce9f45fbf96320544e86b00d2066dfa97d41cd86c1342a'
            'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')

if [[ $CARCH = x86_64 ]]; then
	source[0]=oracle-${pkgname%%-*}$(echo $pkgver | sed -r 's/^([0-9]+\.[0-9]+).*$/\1/')-${pkgname#*-}-${pkgver}.0-1.$CARCH.zip
	md5sums=('5bb55794190d4131133c92adfba57f8a'
           '2d62e22e4f2d7e6d220fafde0f692a7d')
	sha256sums=('9f3fca68466592c2c33c45c1aad5191dc40499c356d25c20d15163fd9ac1af91'
              'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')
fi

build() {
	local dest=$pkgdir/opt/${pkgname%%-*}

	# copy files
	local pkgver=${pkgver/./_}
	install -d "${dest%/*}" "$pkgdir/usr/bin" &&
	cp -a "$srcdir/${pkgname%%-*}_${pkgver%%.*}" "$dest" &&
	ln -s "/opt/${pkgname%%-*}/odbc_update_ini.sh" \
		"$pkgdir/usr/bin/odbc_update_ini" || return 1

	# fix permissions
	cd "$dest" &&
	chmod a=rx,u+w * &&
	chmod a-x *.htm{,l} || return 1

	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 noet:
