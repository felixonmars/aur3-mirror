# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Gour <gour@gour-nital.com>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Contributor: Jan Rüegg <rggjan@gmail.com>
# Contributor: BaSh <bash.lnx@gmail.com>
# Contributor: Bruno Aleci <brunoaleci@gmail.com>
# Contributor: Fabian Melters <melters [at] gmail [dot] com>

pkgname=dvdwizard
pkgver=0.7.1
pkgrel=1
pkgdesc="A set of bash scripts for converting MPEG streams into DVDs with chapters and menus"
arch=('any')
url="http://dvdwizard.wershofen.de/"
license=('GPL')
depends=('bc>=1.06' 'dvdauthor>=0.6.14' 'ffmpeg>=0.4.9' 'imagemagick>=6.3.5'
         'mjpegtools>=1.8.0' 'transcode>=1.0.2' 'texlive-core')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b035501ef50038d24197fa5b53810532')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  make prefix=/usr DESTDIR="$pkgdir" install
}
