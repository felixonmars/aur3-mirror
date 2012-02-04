# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Terry Mitchell <tcmdvm@charter.net>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=bin32-acroread-fr
pkgver=9.4.2
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. French version"
arch=('x86_64')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')
depends=('desktop-file-utils' 'lib32-gtk2' 'lib32-mesa' 'lib32-libxml2' 'xcb-util')
makedepends=('patch')
optdepends=('lib32-libcanberra: XDG sound support'
            'nspluginwrapper: 32 bit plugin in 64 bit browser support')
provides=("acroread=$pkgver")
conflicts=('acroread' 'acroread-fr' 'bin32-acroread')
install=(acroread.install)
source=(ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/${pkgver}/fra/AdbeRdr${pkgver}-1_i486linux_fra.tar.bz2 \
	acroread-lib32.patch)
md5sums=('90ccc9e2b1d3aebacc3854b251f81db2'
         'c6eb179dbc5c5642acf58a6b74332dba')
sha256sums=('b5d017859057ea1ff2ea6c238a33cb7f5f4ab404c06b0a91d9c9ae41baa1e051'
            'f85bb2cfa03a87a768b7021ebc3025151eab8fcaf087bbcf603616c8f89ff920')

build() {
  cd "$srcdir/AdobeReader"
  bsdtar -xf COMMON.TAR
  bsdtar -xf ILINXR.TAR
  cd Adobe/Reader9

  patch -Np3 < "$srcdir/acroread-lib32.patch"
}

package() {
  cd "$srcdir/AdobeReader/Adobe/Reader9"

  msg2 "Installing Main Files..."
  mkdir -p "$pkgdir/usr/lib32/acroread"
  cp -a * "$pkgdir/usr/lib32/acroread"

  msg2 "Installing Bin Files..."
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../lib32/acroread/bin/acroread "$pkgdir/usr/bin"
  install -Dm644 Resource/Shell/acroread.1.gz "$pkgdir/usr/share/man/man1/acroread.1.gz"
  install -Dm644 Resource/Shell/acroread_tab "$pkgdir/etc/bash_completion.d/acroread"

  msg2 "Installing Broswer Plugin..."
  mkdir -p "$pkgdir/usr/lib/mozilla/plugins"
  ln -s ../../../lib32/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins"
	
  msg2 "Installing Icon Resource..."
  install -Dm644 Resource/Support/AdobeReader.desktop "$pkgdir/usr/share/applications/acroread.desktop"
  sed -i '/^Icon/s|AdobeReader9|acroread|' "$pkgdir/usr/share/applications/acroread.desktop"
  install -Dm644 Resource/Icons/64x64/AdobeReader9.png "$pkgdir/usr/share/pixmaps/acroread.png"

  msg2 "Installing License..."
  install -Dm644 Reader/Legal/en_US/License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}