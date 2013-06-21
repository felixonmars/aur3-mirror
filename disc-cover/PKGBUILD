# Disc-Cover 1.5.6 by J.I. van Hemert
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=disc-cover
pkgver=1.5.6
pkgrel=5
pkgdesc="Retrieves CDDB entries for a CD and creates a leaflet (/dev/cd -> xy.ps)"
arch=('i686' 'x86_64')
url="http://www.vanhemert.co.uk/disc-cover.html"
license=('PerlArtistic' 'GPL')
depends=('perl' 
	'perl-uri' 
	'perl-html-parser' 
	'perl-libwww' 
	'perl-cddb' 
    'perl-audio-cd>=0.05-3'
    'texlive-bin' )
optdepends=('ImagaMagick: for cover images')
options=(!emptydirs !zipman)
install="$pkgname.install"
source=(http://downloads.sourceforge.net/disc-cover/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/'latin1';/'utf8';/" disc-cover
  sed -i "s/are, latin1/are utf8, latin1/" disc-cover
  sed -i 's/"latin1";/"utf8";/' disc-cover
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 disc-cover $pkgdir/usr/bin/disc-cover
  install -d -m 755 $pkgdir/usr/share/$pkgname/templates
  install -m 644 templates/* $pkgdir/usr/share/$pkgname/templates
}

md5sums=('4d8cf0e644a9b311f7e6ed44944b9033')
