# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>

pkgname=acroread-de
pkgver=9.4
_pkgver=9.4.0
pkgrel=2
pkgdesc="Adobe Reader is a PDF file viewer - german version / deutschsprachige Version"
arch=('i686' 'x86_64')
url="http://www.adobe.com/de/products/reader/"
license=('custom')
depends=('desktop-file-utils' 'libidn')

if [[ "$CARCH" == 'i686' ]]; then
  depends+=('gtk2' 'libxml2' 'mesa')
else
  depends+=('lib32'-{'gtk2','libxml2','mesa'})
fi

replaces=('bin32-acroread-de')
conflicts=('acroread')
options=('!strip')
install=acroread-de.install
source=(ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/$_pkgver/deu/AdbeRdr$pkgver-1_i486linux_deu.tar.bz2)
md5sums=('a916a6ce85a7fcbf288beef9f3c7b55b')

build() {
  true
}

package() {
  cd "$srcdir/AdobeReader/"
  bsdtar -xf COMMON.TAR
  bsdtar -xf ILINXR.TAR

  cd "$srcdir/AdobeReader/Adobe/Reader9/"

  mkdir -p "$pkgdir/usr/lib/acroread"
  cp -a * "$pkgdir/usr/lib/acroread"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/lib/acroread/bin/acroread "$pkgdir/usr/bin"
  install -Dm644 Resource/Shell/acroread.1.gz "$pkgdir/usr/share/man/man1/acroread.1.gz"
  install -Dm644 Resource/Shell/acroread_tab "$pkgdir/etc/bash_completion.d/acroread"

  mkdir -p "$pkgdir/usr/lib/mozilla/plugins"
  ln -s /usr/lib/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins"

  install -Dm644 Resource/Support/AdobeReader.desktop "$pkgdir/usr/share/applications/acroread.desktop"
  sed -i '/^Icon/s|AdobeReader9|acroread|' "$pkgdir/usr/share/applications/acroread.desktop"
  install -Dm644 Resource/Icons/64x64/AdobeReader9.png "$pkgdir/usr/share/pixmaps/acroread.png"

  install -Dm644 Reader/Legal/de_DE/License.txt "$pkgdir/usr/share/licenses/acroread-de/License.txt"
}
