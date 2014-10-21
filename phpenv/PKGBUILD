# Maintainer: Vasiliy Lapin <profet@yandex.ru>
pkgname=phpenv
pkgver=20131127
pkgrel=1
pkgdesc="PHP multi-version installation and management for humans"
arch=('i686' 'x86_64')
url="https://github.com/phpenv/phpenv"
license=('MIT')
install='phpenv.install'
source=(
	'https://github.com/phpenv/phpenv/archive/d21fe1730a6d26d079a1722424a3ddbdb69381f2.tar.gz'
	'php-fpm_env.service'
	'php-fpm_env'
)
md5sums=(
	'6c455aa1ec65403bd993e009c8a915fb'
	'37005e1336905dd48e2020237f877571'
	'07bfe526a718aa992112de9054bde6b1'
	)
package() {
	install -d -m755 ${pkgdir}/usr/lib/phpenv
	cp -r ${srcdir}/phpenv-d21fe1730a6d26d079a1722424a3ddbdb69381f2/* ${pkgdir}/usr/lib/phpenv/
	install -D -m644 ${srcdir}/php-fpm_env.service ${pkgdir}/usr/lib/systemd/system/php-fpm_env.service
	install -D -m755 ${srcdir}/php-fpm_env ${pkgdir}/usr/bin/php-fpm_env
}