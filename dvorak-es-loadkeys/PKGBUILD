# Maintainer : chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=dvorak-es-loadkeys
pkgver=0.1
pkgrel=1
pkgdesc="A configuration file for loadkeys that allows the activation of the dvorak-es layout in a text console"
arch=('any')
url="http://djelibeibi.unex.es/dvorak/"
license=('unknown')
md5sums=('b08e06e23b9aaa01f4ebd4920917745c')
source=(dvorak-es.kmap)

build() {
	#cd $srcdir/
	install -d -m755 $pkgdir/usr/share/kbd/keymaps/i386/dvorak/
	gzip -5 -c <dvorak-es.kmap > $pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvorak-es.kmap.gz
}
