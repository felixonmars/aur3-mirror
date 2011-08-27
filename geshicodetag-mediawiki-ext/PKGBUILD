# Maintainer : Daniel Neve the.mephit@googlemail.com
pkgname=geshicodetag-mediawiki-ext
pkgver=1.65
pkgrel=1
pkgdesc="Syntax highlighting extension for MediaWiki"
arch=('any')
url="http://www.mediawiki.org/wiki/Extension:GeSHiCodeTag"
license=("GPL")
depends=('mediawiki')
md5sums=('06fa38d66bde39644e73f649ebc3f1aa'
		'183de275099154a7a78aa81507ac5c84')
install=geshicodetag.install
source=(GeshiCodeTag.php
		http://downloads.sourceforge.net/project/geshi/geshi/GeSHi%201.0.8.8/geshi-1.0.8.8.tar.gz)

build() {
	cd $srcdir
	install -D -m0644 $srcdir/GeshiCodeTag.php $pkgdir/srv/http/mediawiki/extensions/geshicodetag/GeshiCodeTag.php || return 1
	
	# They are not required for geshi to function
	# and can pose a security risk in live sites so remove them 
	# to be on the safe side
	rm -rf $srcdir/geshi/contrib || return 1
	rm -rf $srcdir/geshi/docs || return 1
	
	mv -f $srcdir/geshi $pkgdir/srv/http/mediawiki/extensions/geshicodetag || return 1
	chmod -R 0644 $pkgdir/srv/http/mediawiki/extensions/geshicodetag || return 1
	chmod 0744 $pkgdir/srv/http/mediawiki/extensions/geshicodetag || return 1
	chmod 0744 $pkgdir/srv/http/mediawiki/extensions/geshicodetag/geshi || return 1
	chmod 0744 $pkgdir/srv/http/mediawiki/extensions/geshicodetag/geshi/geshi || return 1
	chown -R http: $pkgdir/srv/http/mediawiki/extensions/geshicodetag || return 1
}
