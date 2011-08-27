# Maintainer : Daniel Neve the.mephit@googlemail.com
pkgname=confirmaccount-mediawiki-ext
pkgver=r62787
pkgrel=1
pkgdesc="A MediaWiki Extension for restricting new user accounts"
arch=('any')
url="http://www.mediawiki.org/wiki/Extension:ConfirmAccount"
license=("GPL")
depends=('mediawiki')
md5sums=('3bd7e259593b3e5a7b07f1798fbdb13f')
install=confirmaccount.install
source=(http://upload.wikimedia.org/ext-dist/ConfirmAccount-MW1.16-r62787.tar.gz)

build() {
	cd $srcdir
	install -d -m0755 $pkgdir/srv/http/mediawiki/extensions || return 1
	mv ConfirmAccount $pkgdir/srv/http/mediawiki/extensions || return 1
	
	# Set permissions
	chmod -R 0644 $pkgdir/srv/http/mediawiki/extensions/ConfirmAccount || return 1
	
	# Re-add x bit to folders
	chmod -R 0744 $pkgdir/srv/http/mediawiki/extensions/ConfirmAccount || return 1
	chmod 0744 $pkgdir/srv/http/mediawiki/extensions/ConfirmAccount/archives || return 1
	chmod 0744 $pkgdir/srv/http/mediawiki/extensions/ConfirmAccount/postgres || return 1
	
	# Set it to be owned by the web user
	chown -R http: $pkgdir/srv/http/mediawiki/extensions/ConfirmAccount || return 1
}
