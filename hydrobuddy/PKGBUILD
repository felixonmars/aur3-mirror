# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=hydrobuddy
pkgver=1.50
pkgrel=1
pkgdesc="Hydroponic Nutrient Calculator"
arch=('i686' 'x86_64')
url="http://scienceinhydroponics.com/2013/02/the-first-free-hydroponic-nutrient-calculator-program-o.html"
license=('GPL' 'BSD')
depends=('gtk2')
makedepends=('lazarus')
source=("http://scienceinhydroponics.com/${pkgname}_v${pkgver/./_}_src.zip")
sha256sums=('52b575cf09f4b0891cee51abb1c9f3aa26df139ca2e0292fda5b54af17e6f509')

prepare() {
  cd "$srcdir/${pkgname}_v${pkgver/./_}_src"

  sed -i 's/, TCIOFLUSH/, Pointer(PtrInt(TCIOFLUSH))/g' synaser.pas
}

build() {
  cd "$srcdir/${pkgname}_v${pkgver/./_}_src"

  lazbuild --lazarusdir=/usr/lib/lazarus hydrobuddy.lpi
}

package() {
  cd "$srcdir/${pkgname}_v${pkgver/./_}_src"

  install -d "$pkgdir/opt/hydrobuddy/" "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m755 hydrobuddy "$pkgdir/opt/hydrobuddy/"
  install -m666 -t "$pkgdir/opt/hydrobuddy/" *.dbf *.mdx update.ini

  echo "cd /opt/hydrobuddy; ./hydrobuddy" > "$pkgdir/usr/bin/hydrobuddy"
  chmod 755 "$pkgdir/usr/bin/hydrobuddy"

  sed -n '/Copyright/,$p;/DAMAGE\./q' synautil.pas > "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
}
