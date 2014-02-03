# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=anchor-cms
pkgver=0.9.2
pkgrel=1
pkgdesc="Anchor is a super-simple, lightweight blog system."
arch=('any')
url="http://anchorcms.com/"
license=('unknown') # https://github.com/anchorcms/anchor-cms/issues/433
depends=('php>=5.3.6' 'mariadb>=5.2' 'php-mcrypt' 'php-gd')
optdepends=()
install=anchor.install
source=("${pkgname}.zip::https://codeload.github.com/anchorcms/anchor-cms/zip/$pkgver")
sha256sums=('e23a6aa9407b8557d547d37ccbe49184d3c7783876b57a8a7f4b48f80370b2c4')

package() {
	_instdir="$pkgdir"/usr/share/webapps/$pkgname
	mkdir -p "$_instdir" "$pkgdir"/etc/webapps "$pkgdir"/srv
	cd "$_instdir"

	msg "Copy application files"
	cp -ra "$srcdir/$pkgname-$pkgver"/* .
	touch .htaccess

	msg2 "Relocate configuration files"
	mv anchor/config "$pkgdir"/etc/webapps/$pkgname
	ln -s /etc/webapps/$pkgname "$_instdir"/anchor/config

	msg2 "Relocate content directory"
	mv content "$pkgdir"/srv/$pkgname
	ln -s /srv/$pkgname "$_instdir"/content
}
