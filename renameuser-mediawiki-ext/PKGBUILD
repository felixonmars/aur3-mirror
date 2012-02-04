# Maintainer : Tim Hartman <tbhartman@gmail.com>
pkgname=renameuser-mediawiki-ext
pkgver=r66255
pkgrel=1
pkgdesc="A MediaWiki Extension which allows renaming of user accounts"
arch=('any')
url="http://www.mediawiki.org/wiki/Extension:Renameuser"
license=("GPL2")
depends=('mediawiki')
install=renameuser-mediawiki-ext.install
source=(http://upload.wikimedia.org/ext-dist/Renameuser-MW1.16-r66255.tar.gz)
md5sums=('3baf28ced1b18a845ebc2e64c313d918')

build() {
	cd $srcdir
	install -d -m0755 $pkgdir/srv/http/mediawiki/extensions || return 1
	cp -a Renameuser $pkgdir/srv/http/mediawiki/extensions || return 1
	
	# Re-add x bit to folders
	chmod -R 0754 $pkgdir/srv/http/mediawiki/extensions/Renameuser || return 1
	
	# Set it to be in web user group
	chown -R root:http $pkgdir/srv/http/mediawiki/extensions/Renameuser || return 1
}
