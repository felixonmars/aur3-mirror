# Contributor: Semen Turchikhin <tursom@gmail.com>

pkgname=ttf-oldstandard
pkgver=2.2
pkgrel=1
pkgdesc="Multilangual font family including regular, italic and bold shapes. TrueType and OpenType formats"
arch=('any')
license=('custom:OFL')
url="http://www.thessalonica.org.ru/en/fonts.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=oldstandard.install
source=(http://www.thessalonica.org.ru/downloads/oldstandard-$pkgver.ttf.zip
        http://www.thessalonica.org.ru/downloads/oldstandard-$pkgver.otf.zip)

md5sums=('d6b17fd7cb4f7a06db95558696f5bb3e'
	       'f590bdf4960c36c9c1cbd0a75e06d721')
sha256sums=('928255f9ca32b9f8f97123aeaa8aa728629fc96074c99f3a28fa1d6f32795ac1'
	          '06866d3d5b491f6749c972e6c893a72a5eaf0d45ac0ada8c6661d704b39e0b76')	 

build() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/fonts/{TTF,OTF}
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/ || return 1
  install -m644 *.otf $startdir/pkg/usr/share/fonts/OTF/ || return 1
  install -D -m644 OFL.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1 
}
