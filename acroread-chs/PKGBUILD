# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>

pkgname=acroread-chs
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Chinese Version"
arch=('i686')
url="http://www.adobe.com/hk_zh/products/acrobat/"
license=('custom')
depends=('gtk2' 'mesa' 'desktop-file-utils')
options=('!strip')
install=acroread.install
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.7/chs/AdobeReader_chs-8.1.7-1.i486.tar.bz2)
md5sums=('679153c6dd74995f8bd6785baea35e27')
sha1sums=('a240eb4b1defa26ceaf3bcfe1526b42a65c2f1ca')

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

  install -D -m644 Reader/Legal/zh_CN/License.txt \
    "$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
}
