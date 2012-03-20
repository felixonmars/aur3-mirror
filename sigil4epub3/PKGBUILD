pkgname=sigil4epub3
basename=sigil
_basename=Sigil
pkgver=0.3.4.3
pkgrel=1
pkgdesc="A WYSIWYG ebook editor for epub3"
arch=('i686' 'x86_64') 
url="http://sourceforge.net/projects/sigil4epub3/"
license=('GPL3')
depends=('qt')
makedepends=('cmake')
provides=('sigil')
conflicts=('sigil')
install=$basename.install
source=("http://sourceforge.net/projects/${pkgname}/files/$_basename-$pkgver/$_basename-$pkgver-SourceCode.zip"
		"$basename.desktop")
md5sums=('732f06f2eea3add21a2d83f66ace5f15'
		'83779d140d681fd18f3a8c917bfa7f2f')

build() {
	cmake -G "Unix Makefiles" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_FLAGS:STRING="$CFLAGS" \
		-DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON $basename
	make
}

package() {
	make install DESTDIR=$pkgdir

	# Desktop integration.
	install -Dm0644 $srcdir/$basename.desktop $pkgdir/usr/share/applications/$basename.desktop
	for _pic in 16 32 48 128 256; do
		install -Dm0644 $basename/src/$_basename/Resource_Files/icon/app_icon_$_pic.png \
			$pkgdir/usr/share/icons/hicolor/$_picx$_pic/apps/$basename.png
	done
}
