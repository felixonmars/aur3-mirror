# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Ganymede
# Contributor: Emmanuel GAUDE <gaude.emmanuel@gmail.com>

pkgname=acroread-fr
pkgver=9.4.2
pkgrel=2
pkgdesc="Adobe Reader is a PDF file viewer. French version."
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/reader/"
license=('custom')
depends=('desktop-file-utils')

if [[ "$CARCH" == 'i686' ]]; then
  depends+=('gtk2' 'mesa')
  optdepends=('libcanberra: XDG sound support'
              'gtk-engines: Theme engines for GTK+ 2 applications')
else
  depends+=('lib32'-{'gtk2','mesa','libxml2','xcb-util'})
  optdepends=('lib32-libcanberra: XDG sound support'
              'lib32-gtk-engines: Theme engines for 32 bits GTK+ 2 applications')
fi

options=('!strip')
install=acroread.install
source=(ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/$pkgver/fra/AdbeRdr$pkgver-1_i486linux_fra.tar.bz2)
md5sums=('90ccc9e2b1d3aebacc3854b251f81db2')

build() {
	cd "$srcdir/AdobeReader"
	bsdtar -xf COMMON.TAR || return 1
	bsdtar -xf ILINXR.TAR || return 1
	cd Adobe/Reader9

	msg2 "Installing Main Files..."
	mkdir -p "$pkgdir/usr/lib/acroread" || return 1
	cp -a * "$pkgdir/usr/lib/acroread" || return 1
	echo done

	msg2 "Installing Bin Files..."
	mkdir -p "$pkgdir/usr/bin" || return 1
	ln -s /usr/lib/acroread/bin/acroread "$pkgdir/usr/bin" || return 1
	install -Dm644 Resource/Shell/acroread.1.gz ${pkgdir}/usr/share/man/man1/acroread.1.gz || return 1
	install -Dm644 Resource/Shell/acroread_tab ${pkgdir}/etc/bash_completion.d/acroread || return 1
	echo done

	msg2 "Installing Broswer Plugin..."
	mkdir -p "$pkgdir/usr/lib/mozilla/plugins" || return 1
	ln -s /usr/lib/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins" || return 1
	echo done
	
	msg2 "Installing Icon Resource..."
	install -D -m644 Resource/Support/AdobeReader.desktop \
	"$pkgdir/usr/share/applications/acroread.desktop" || return 1
	sed -i '/^Icon/s|AdobeReader9|acroread|' \
	"$pkgdir/usr/share/applications/acroread.desktop"
	install -D -m644 Resource/Icons/64x64/AdobeReader9.png \
	"$pkgdir/usr/share/pixmaps/acroread.png" || return 1
	echo done

	msg2 "Installing License..."
	install -D -m644 Reader/Legal/fr_FR/License.txt \
	"$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
	echo done
	
	#Bash completion fix
	sed -i "s/_filedir/_filedir_acroread/" "$pkgdir/etc/bash_completion.d/acroread"
}
