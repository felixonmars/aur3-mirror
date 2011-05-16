# Maintainer : Tim Hartman <tbhartman@gmail.com>
pkgname=openid-mediawiki-ext
pkgver=r66255
pkgrel=1
pkgdesc="A MediaWiki Extension for using OpenID"
arch=('any')
url="http://www.mediawiki.org/wiki/Extension:OpenID"
license=("GPL")
depends=('mediawiki' 'php-openid')
install=openid.install
source=(http://upload.wikimedia.org/ext-dist/OpenID-MW1.16-${pkgver}.tar.gz)
md5sums=('8e53de323bec48dd9f3e86d50e198393')

build() {
	cd $srcdir
	install -d -m0755 $pkgdir/srv/http/mediawiki/extensions || return 1
	cp -a OpenID $pkgdir/srv/http/mediawiki/extensions || return 1
	
	# Set permissions
	chmod -R 0644 $pkgdir/srv/http/mediawiki/extensions/OpenID || return 1
	
	# Re-add x bit to folders
	chmod -R 0754 $pkgdir/srv/http/mediawiki/extensions/OpenID || return 1
	
	# Set it to be in web user group
	chown -R root:http $pkgdir/srv/http/mediawiki/extensions/OpenID || return 1
	
	# Link to Auth from php-openid
	cd "${pkgdir}/srv/http/mediawiki/extensions/OpenID"
	ln -s "../../../../usr/lib/php-openid/Auth"
}
