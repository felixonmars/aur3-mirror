# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=audiotag-thumbnailer
pkgver=0.1
pkgrel=2
pkgdesc="A nautilus thumbnailer for MP3 and OGG file"
PASTEBIN_ID="E4qCRucH"

arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=114098"
license=("custom:WTFPL")
depends=('mutagen' 'python2')
source=("audiotag-thumbnailer"
        'audiotag.thumbnailer')
md5sums=('d18561afaee9343ffdf30314026b33ee'
         'ec9fe64b57122c09522a5e38fb5783d9')

build() {
	cd $srcdir
}

package() {
	mkdir -p $pkgdir/usr/{share/thumbnailers,bin}
	install -m644 audiotag.thumbnailer $pkgdir/usr/share/thumbnailers
	install -m755 audiotag-thumbnailer $pkgdir/usr/bin
}
