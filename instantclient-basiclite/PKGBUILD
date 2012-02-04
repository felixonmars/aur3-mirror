# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>

pkgname=instantclient-basiclite
pkgver=11.2.0.2.0
pkgrel=1
pkgdesc="Lighter replacement for the Oracle client (files to run OCI, OCCI and JDBC-OCI programs)"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=('gcc-libs' 'libaio')
provides=("instantclient-basic=$pkgver")
conflicts=('instantclient-basic')
install=$pkgname.install
#
# Grab the source from
# i686  : http://www.oracle.com/technetwork/topics/linuxsoft-082809.html
# x86_64: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
# AMD64: http://www.oracle.com/technetwork/topics/linux-amd64-093390.html
#
source=($pkgname-linux32-$pkgver.zip LICENSE)
md5sums=('4a5faca63686ba46eb01876267c06872'
         '2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('b05f022483b385022e1aadeaf3e166a93137c8077a9e9b2074c19f1aa07df7d2'
            'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')

if [[ $CARCH = x86_64 ]]; then
	source=($pkgname-linux-x86-64-$pkgver.zip LICENSE)
	md5sums=('9fa61d0216fdf64af1b5247734f2f291'
			 '2d62e22e4f2d7e6d220fafde0f692a7d')
	sha256sums=('97b49e87f0c8073a3dc980f6b2d247e33be4f3d5605569b6f4199bf51e634183'
				'f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')
fi

package() {
	local dest=$pkgdir/opt/${pkgname%%-*}

	# copy files
	local pkgver=${pkgver/./_}
	install -d "${dest%/*}" &&
	cp -a "$srcdir/${pkgname%%-*}_${pkgver%%.*}" "$dest" || return 1

	# create required symlinks
	cd "$dest" || return 1
	local lib link
	for lib in *.so*; do
		link=$lib
		while [[ ${link#*.} != so ]]; do
			link=${link%.*}
			ln -s $lib $link
		done
	done

	# fix permissions
	chmod a=rx,u+w * &&
	chmod a-x *_README *.jar || return 1

	# set ld path
	install -d "$pkgdir/etc/ld.so.conf.d" &&
	echo "/opt/instantclient" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" || return 1

	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 noet:
