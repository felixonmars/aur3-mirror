# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=freebirth
pkgver=0.3.2
pkgrel=2
pkgdesc="Free GTK software bass synthesizer step sequencer"
arch=('i686' 'x86_64')
url="http://freebirth.sourceforge.net/"
license=('GPL')
depends=('gtk2')
optdepends=('sox: convert wav2raw')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.patch")
md5sums=('672fc239f583a76b5519ac03a76d25d7'
         'cb759893912d7eafa3b52ffc9a1cbcb8'
         'f0e445d004f06437ad5c4c295295cd15')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # a lot of fixes
  patch -Np1 -i ../$pkgname.patch

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # preparing dest folders
  install -d "$pkgdir"/usr/{bin,share/{applications,pixmaps,$pkgname/raw}}

  # bin and datas
  install -Dm755 {freebirth,wav_to_raw} "$pkgdir/usr/bin"
  install -Dm644 raw/*.raw "$pkgdir/usr/share/freebirth/raw"

  # desktop and pixmaps
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications"
  install -Dm644 xpm/$pkgname.xpm "$pkgdir/usr/share/pixmaps"
}
