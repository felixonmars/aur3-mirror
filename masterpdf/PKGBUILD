# Maintainer: SirPortal <carsanda@yandex.ru>
pkgname=masterpdf
pkgver=2.2.15
pkgrel=7
pkgdesc="Master Pdf Editor is a convenient and smart PDF and XPS editor"
arch=("i686")
url="http://code-industry.net/free-pdf-editor.php"
license=('custom')
depends=('qt4' 'gcc-libs' 'glibc' 'glib2' 'freetype2' 'libpng' 'zlib' 'libsm'
		'libice' 'libxrender' 'fontconfig' 'libxext' 'libx11' 'openssl' 'bzip2'
		'harfbuzz' 'libutil-linux' 'pcre' 'libffi' 'expat' 'graphite' 'libxau'
		'libxdmcp' 'libxcb')
makedepends=('coreutils')
source=("http://code-industry.net/public/master-pdf-editor_2.2.15_i386.tar.gz"
		masterpdf.desktop)
md5sums=('4bde4a5a55e97ff21c333a34e7bde177'
		'fbfb29e5dbecc0ab1b6d8144e12fe805')

package() {
	#bsdtar -xf master-pdf-editor_2.2.15_i386.tar.gz
	install -dm755 $pkgdir/opt/Master_PDF_Editor
	install -dm755 $pkgdir/usr/bin
	cp -R $srcdir/master-pdf-editor/* $pkgdir/opt/Master_PDF_Editor
	install -m755 $srcdir/master-pdf-editor/master-pdf-editor $pkgdir/usr/bin
	install -dm755 $pkgdir/usr/share/applications
	install -m755 $srcdir/masterpdf.desktop $pkgdir/usr/share/applications
}
