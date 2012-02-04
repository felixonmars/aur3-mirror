# Contributor: van Rilland Bath <vanrillandbath yahoo co uk>

pkgname=acroread-nl
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Reader is a PDF file viewer. Dutch version."
arch=('i686')
url="http://www.adobe.com/products/reader/"
license=('custom')
depends=('gtk2' 'mesa' 'desktop-file-utils')
conflicts=('acroread')
options=('!strip')
install=acroread.install
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/$pkgver/nld/AdobeReader_nld-$pkgver-1.i486.tar.bz2)
md5sums=('f9071519a1860bb185a5a09f6db91d13')

build() {
  cd "$srcdir/AdobeReader"
  bsdtar -xf COMMON.TAR || return 1
  bsdtar -xf ILINXR.TAR || return 1
  cd Adobe/Reader8

  mkdir -p "$pkgdir/usr/lib/acroread" || return 1
  cp -a * "$pkgdir/usr/lib/acroread" || return 1

  mkdir -p "$pkgdir/usr/bin" || return 1
  ln -s /usr/lib/acroread/bin/acroread "$pkgdir/usr/bin" || return 1

  mkdir -p "$pkgdir/usr/lib/mozilla/plugins" || return 1
  ln -s /usr/lib/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins" || return 1

  install -D -m644 Resource/Support/AdobeReader.desktop \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  sed -i 's|AdobeReader8.png|acroread|' \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  install -D -m644 Resource/Icons/64x64/AdobeReader8.png \
    "$pkgdir/usr/share/pixmaps/acroread.png" || return 1

  install -D -m644 Reader/Legal/nl_NL/License.txt \
    "$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
}
