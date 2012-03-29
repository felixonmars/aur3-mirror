# Maintainer: karabaja4 <karabaja4@archlinux.us>

pkgname=mupdf-patched
pkgver=0.9
pkgrel=1
pkgdesc="mupdf with sane scrolling hack, and a DPI detection hack."
arch=('i686' 'x86_64')
url="http://mupdf.com"
license=('GPL3')
depends=('freetype2' 'libjpeg' 'jbig2dec' 'openjpeg' 'libxext')
conflicts=('mupdf' 'mupdf-git')
install=mupdf.install
source=("http://mupdf.com/download/archive/mupdf-$pkgver-source.tar.gz"
	"scroll_hack.patch"
	"dpi_hack.patch")
md5sums=('76640ee16a797a27fe49cc0eaa87ce3a'
	 '7719aaad7eade8153fd17e0d41e8f5eb'
	 'ede4f578c22a9a75e44ea84223c63016')

build() {
	cd "$srcdir/mupdf-$pkgver"
	
	# Patch the scrolling
	msg "Applying scroll patch..."
	patch -p1 -i ../scroll_hack.patch
	
	# Patch the dpi
	msg "Applying dpi patch..."
	patch -p1 -i ../dpi_hack.patch
	
	make build=release prefix="$pkgdir/usr"
}

package() {
	
	# Install
	cd "$srcdir/mupdf-$pkgver"
	make build=release prefix="${pkgdir}/usr" install

	# Rename executables
	msg "Renaming executables"
	cd "${pkgdir}/usr/bin"
	for i in pdf*; do 
		mv "$i" "$i-mupdf";
	done

	cd "$srcdir/mupdf-$pkgver"
	# Fix mupdf.desktop
	sed -i "s/mupdf.xpm/mupdf/" debian/mupdf.desktop
  	sed -i "s/application\/x-pdf/application\/x-pdf/" debian/mupdf.desktop

	# Install other stuff
	cd "$srcdir/mupdf-$pkgver/debian"
	install -Dm644 mupdf.desktop "$pkgdir/usr/share/applications/mupdf.desktop"
  	install -Dm644 mupdf.xpm "$pkgdir/usr/share/pixmaps/mupdf.xpm"
}
