# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Geraldo Augusto Vecchiato <geraldoav@gmail.com>

pkgname=instantclient-sqlplus
pkgver=11.2.0.2.0
pkgrel=2
pkgdesc="Additional libraries and executable for running SQL*Plus with Instant Client."
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=("instantclient-basic=$pkgver")
#
# Grab the source from
# i686  : http://www.oracle.com/technetwork/topics/linuxsoft-082809.html
# x86_64: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
# AMD64: http://www.oracle.com/technetwork/topics/linux-amd64-093390.html
#
source=($pkgname-linux32-$pkgver.zip LICENSE)
md5sums=('6d6912d016d42fcc36335275885c781f'
         '2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('35f1d447b0b368bcafd4fcff6bb04139e568176f0081a60aea1939099754ea0a'
            'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')

if [[ $CARCH = x86_64 ]]; then
	source=($pkgname-linux-x86-64-$pkgver.zip LICENSE)
	md5sums=('805460a9d387c53c615e64d026bf15b9'
           '2d62e22e4f2d7e6d220fafde0f692a7d')
	sha256sums=('6975856f27c66d44b5c57c9ffa877f8aa5648ae8e4bda925d719b8609bbbf285'
              'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')
fi

build() {
	local dest=$pkgdir/opt/${pkgname%%-*}

	# copy files
	local pkgver=${pkgver/./_}
	install -d "${dest%/*}" "$pkgdir/usr/bin" &&
	cp -a "$srcdir/${pkgname%%-*}_${pkgver%%.*}" "$dest" &&
	ln -s "/opt/${pkgname%%-*}/sqlplus" \
		"$pkgdir/usr/bin/" || return 1

	# fix permissions
	cd "$dest" &&
	chmod a=rx,u+w * &&
	chmod a-x *_README *.sql || return 1

	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 noet:
