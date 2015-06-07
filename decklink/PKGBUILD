# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink
_dvver=10.4a17 # DesktopVideo
_mever=3.4a9 # MediaExpress
pkgver=${_dvver}
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/products/"
license=('custom')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')
install='decklink.install'
source=("file://Blackmagic_Desktop_Video_Linux_${pkgver%a*}.tar.gz"
        'decklink.patch')
sha256sums=('b6075ede56f3bbf882390a423a0dfa117d74d7cea5cd780c01cc6d935bfb76c0'
            '2273e769a7d971869343548ef7c5dbf2c50c73e541a4ca744f6cba319e2bb220')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	cd "$srcdir/Blackmagic_Desktop_Video_Linux_${pkgver%a*}/other/${_arch}"

	tar xf "desktopvideo-${_dvver}-${_arch}.tar.gz"
	cp -a "desktopvideo-${_dvver}-${_arch}/"* "$pkgdir"
	mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
	rm -rf "$pkgdir/usr/sbin"

	tar xf "mediaexpress-${_mever}-${_arch}.tar.gz"
	cp -a "mediaexpress-${_mever}-${_arch}/"* "$pkgdir"

	cd "${pkgdir}"
	patch -p1 < "${srcdir}/decklink.patch"
}
