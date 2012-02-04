# Contributor: Semen Turchikhin <tursom@gmail.com>

pkgname=ttf-theano
pkgver=2.0
pkgrel=1
pkgdesc="Font family designed from historic samples. Contains Greek and Latin letters."
arch=('any')
license=('custom:OFL')
url="http://www.thessalonica.org.ru/en/fonts.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=theano.install
source=(http://www.thessalonica.org.ru/downloads/theano-$pkgver.ttf.zip
        http://www.thessalonica.org.ru/downloads/theano-$pkgver.otf.zip)

md5sums=('ddaca401dae2858d0922acdd64c0d6bc'
	       '7c4b1f3ef4099e492903aee4ef96e5fa')
sha256sums=('3cabb1e2b874f567606195f4e44e3d97dd23c6406e7f711f63fd848d2582e378'
	          'e69375109af4af1328b3fcee338546ab08db5ee52a0d33c6749babb8169e3ef6')	 

build() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/fonts/{TTF,OTF}
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/ || return 1
  install -m644 *.otf $startdir/pkg/usr/share/fonts/OTF/ || return 1
  install -D -m644 OFL.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1 
}
