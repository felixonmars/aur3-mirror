# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=instantclient-jdbc
pkgver=11.2.0.2.0
pkgrel=1
pkgdesc="Additional support for XA, Internationalization, and RowSet operations under JDBC"
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
[ $CARCH = "x86_64" ] && source=($pkgname-linux-x86-64-$pkgver.zip LICENSE)

build() {
	local dest=$pkgdir/opt/${pkgname%%-*}

	# copy files
	local pkgver=${pkgver/./_}
	install -d "${dest%/*}" &&
	cp -a "$srcdir/${pkgname%%-*}_${pkgver%%.*}" "$dest" || return 1

	# fix permissions
	cd "$dest" &&
	chmod a=rx,u+w * &&
	chmod a-x *_README *.jar || return 1

	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

[ $CARCH = "x86_64" ] && {
md5sums=('2f101569da1824eba9d9cdd393dce2ff'
         '2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('07fcfbd61a183588813fb755dafd04c052a771959fcbc4ee89e2180337d6c537'
            'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')
} || {
md5sums=('b9e46ce5dba8f7b75616a5258dce30c7'
         '2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('25b58a2a42407d665af6e913066de716d9fe16ebda140954b8f03b71056871cb'
            'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')
}
