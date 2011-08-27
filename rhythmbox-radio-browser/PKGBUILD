pkgname=rhythmbox-radio-browser
pkgver=2.4
pkgrel=1
pkgdesc="Rhythmbox plugin that shows the radio station lists of icecast and shoutcast directly in rhythmbox"
arch=(any)
url="http://www.programmierecke.net/programmed/rhythmbox-radio-browser.html"
license=('GPL3')
depends=('rhythmbox')
optdepends=('streamripper: for recording radio stations')
source=(http://www.programmierecke.net/programmed/$pkgname-$pkgver.tar.gz)
md5sums=('f6377a57c79b0426d4a36d6ae47ebcae')

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
