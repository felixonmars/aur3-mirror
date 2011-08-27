# Maintainer : Tim Hartman <tbhartman@gmail.com>
pkgname=parserfunctions-mediawiki-ext
pkgver=r62695
pkgrel=1
pkgdesc="A MediaWiki Extension for additional parser functions"
arch=('any')
url="http://www.mediawiki.org/wiki/Extension:ParserFunctions"
license=("GPL2")
depends=('mediawiki')
install=parserfunctions.install
source=(http://upload.wikimedia.org/ext-dist/ParserFunctions-MW1.16-${pkgver}.tar.gz)
md5sums=('58164fabb5d5cea9feae1150fcd53a03')

build() {
	cd $srcdir
	install -d -m0755 $pkgdir/srv/http/mediawiki/extensions || return 1
	cp -a ParserFunctions $pkgdir/srv/http/mediawiki/extensions || return 1
	
	# Re-add x bit to folders
	chmod -R 0754 $pkgdir/srv/http/mediawiki/extensions/ParserFunctions || return 1
	
	# Set it to be in web user group
	chown -R root:http $pkgdir/srv/http/mediawiki/extensions/ParserFunctions || return 1
}
