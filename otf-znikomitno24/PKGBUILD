pkgname=otf-znikomitno24
pkgver=0.54
pkgrel=3
pkgdesc="Geometrical, decorative serif font ZnikomitNo24 based on Font Znikomit."
arch=('any')
url="http://www.glukfonts.pl/"
license=('Open Font License')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.glukfonts.pl/fontdl/1303/font/ZnikomitNo24/ZnikomitNo24.zip)
md5sums=('abf460db739c38f226e89b523467a66a')

build() {
	install -Dm644 $srcdir/*.otf $pkgdir/usr/share/fonts/OTF/ZnikomitNo24.otf
	install -Dm644 $srcdir/OFL_License.txt $pkgdir/usr/share/licenses/otf-znikomitno24/OFL_License.txt
}
