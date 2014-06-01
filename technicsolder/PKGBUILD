# Maintainer: Robin McCorkell <rmccorkell@karoshi.org.uk>
_realpkgver=settingsyield
pkgname=technicsolder
pkgver=0.6.1
pkgrel=2
pkgdesc="An API for creating and managing modpacks for the Technic platform"
arch=('any')
url="https://github.com/TechnicPack/TechnicSolder"
license=('MIT')
depends=('php>=5.3' 'php-gd' 'php-mcrypt')
makedepends=()
checkdepends=()
optdepends=('php-apache: to use the Apache web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'mariadb: to use the MySQL database backend')
options=('!strip')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/TechnicPack/TechnicSolder/archive/$_realpkgver.tar.gz"
        "TechnicSolder-0.6-paths_php_symlink.patch")
md5sums=('fac50b80b95f7ecb78d1f93e8acd97b1'
         '2f3714c5bef53fb2ebab5dfc06ce8d7e')

prepare() {
	mv "$srcdir/TechnicSolder-$_realpkgver" "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir"/TechnicSolder-0.6-paths_php_symlink.patch
}

package() {
	install -D -m644 "$srcdir/$pkgname-$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"

	install -d "$pkgdir/usr/share/webapps"
	cp -aT "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/webapps/$pkgname"

	# move config files to /etc/webapps
	install -d "$pkgdir/etc/webapps/$pkgname"
	mv -T "$pkgdir/usr/share/webapps/$pkgname/application/config-sample" \
		"$pkgdir/etc/webapps/$pkgname/config"
	ln -s "$pkgdir/etc/webapps/$pkgname/config" \
		"$pkgdir/usr/share/webapps/$pkgname/application/config"
	mv -T "$pkgdir/usr/share/webapps/$pkgname/paths.php" \
		"$pkgdir/etc/webapps/$pkgname/paths.php"
	ln -s "$pkgdir/etc/webapps/$pkgname/paths.php" \
		"$pkgdir/usr/share/webapps/$pkgname/paths.php"

	# rename sample .htaccess
	mv -T "$pkgdir"/usr/share/webapps/$pkgname/public/.htaccess{-sample,}
}
