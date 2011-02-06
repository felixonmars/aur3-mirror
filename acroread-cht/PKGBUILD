# Maintainer: michelin <linuxisfun0104@gmail.com>

pkgname=acroread-cht
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Traditional Chinese Version"
arch=('i686')
url="http://www.adobe.com/tw/products/acrobat/"
license=('custom')
depends=('gtk2' 'mesa' 'desktop-file-utils')
conflicts=('acroread' 'acroread-chs')
options=('!strip')
install=acroread.install
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.7/cht/AdobeReader_cht-8.1.7-1.i486.tar.bz2)

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

  install -D -m644 Reader/Legal/zh_TW/License.txt \
    "$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
}

md5sums=('765d4cc21f669a53f630a44d2f990711')
