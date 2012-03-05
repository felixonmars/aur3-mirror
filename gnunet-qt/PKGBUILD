# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=gnunet-qt
pkgver=0.8.1
pkgrel=1
pkgdesc="A Qt interface for accessing GNUnet"
arch=(i686 x86_64)
url="https://gnunet.org/"
license=("GPL")
depends=("gnunet>=${pkgver}" "qt" "libnotify" "adns")
options=(!emptydirs)
source=(
  "ftp://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
  "ftp://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz.sig"
  "$pkgname.desktop"
)
sha512sums=('1b837a007d60280bcd708aca05442e03cfc41b70d987662f39d8dc0d297450f50edfbf7f76ce33f0d5e8229153b59ec1fe422c0cf6e8c3a5a530d892cbbc6a37'
            '8485a86a6d8cad87a3829351d116eb8ee2775b3168dd0203865d3d331e7010222e9384d10f9c4ca1f496f2414fe5e6fc296138b949f7476a78a1afc37e048897'
            'c701b8741b2d068150888081d488ac1082e03b615c36ce23a473dd95818c396df67da44a762dc6548c0e9bb6abe368e04421e1b28ca06770d42c909eccbce144')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-extractor --with-gnunet
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
