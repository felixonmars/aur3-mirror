# Maintainer : Tim Hartman <tbhartman@gmail.com>
pkgname=semantic-mediawiki-ext
pkgver=1.5.6
pkgrel=1
pkgdesc="A MediaWiki Extension for storing and querying data"
arch=('any')
url="http://www.semantic-mediawiki.org"
license=("GPL")
depends=('mediawiki' 'mysql')
install=semantic.install
source=(http://downloads.sourceforge.net/project/semediawiki/semediawiki/Semantic%20MediaWiki%20${pkgver}/SemanticMediaWiki${pkgver}.tgz)
md5sums=('a436f07cd3be24ae99ff33b748c6c664')

build() {
	cd $srcdir
	install -d -m0755 $pkgdir/srv/http/mediawiki/extensions || return 1
	cp -a SemanticMediaWiki $pkgdir/srv/http/mediawiki/extensions || return 1
	
	# Set permissions
	chmod -R 0644 $pkgdir/srv/http/mediawiki/extensions/SemanticMediaWiki || return 1
	
	# Re-add x bit to folders
	chmod -R 0754 $pkgdir/srv/http/mediawiki/extensions/SemanticMediaWiki || return 1
	
	# Set it to be in web user group
	chown -R root:http $pkgdir/srv/http/mediawiki/extensions/SemanticMediaWiki || return 1
}
