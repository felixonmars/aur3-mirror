# Contributor: Gilles Guillotin <gilles.guillotin (at) free (dot) fr>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=acroread-fr
pkgver=9.3
pkgrel=3
pkgdesc="Adobe Acrobat Reader for viewing PDF files. French version"
arch=('i686')
url="http://www.adobe.com/products/reader/"
license=('custom')
depends=('gtk2' 'mesa' 'desktop-file-utils')
options=('!strip')
install=acroread.install
source=(ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.3/fra/AdbeRdr9.3-1_i486linux_fra.tar.bz2)
md5sums=('ab6bccafa6dfb080e2adc08d3b28f03a')

build() {
  cd "$srcdir/AdobeReader"
  bsdtar -xf COMMON.TAR || return 1
  bsdtar -xf ILINXR.TAR || return 1
  cd Adobe/Reader9

  msg2 "Installing Main Files..."
  mkdir -p "$pkgdir/usr/lib/acroread" || return 1
  cp -a * "$pkgdir/usr/lib/acroread" || return 1
  echo done

  msg2 "Installing Bin Files..."
  mkdir -p "$pkgdir/usr/bin" || return 1
  ln -s /usr/lib/acroread/bin/acroread "$pkgdir/usr/bin" || return 1
  install -Dm644 Resource/Shell/acroread.1.gz ${pkgdir}/usr/share/man/man1/acroread.1.gz || return 1
  install -Dm644 Resource/Shell/acroread_tab ${pkgdir}/etc/bash_completion.d/acroread || return 1
  echo done
  
  msg2 "Installing Broswer Plugin..."
  mkdir -p "$pkgdir/usr/lib/mozilla/plugins" || return 1
  ln -s /usr/lib/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins" || return 1
  echo done
    
  msg2 "Installing Icon Resource..."
  install -D -m644 Resource/Support/AdobeReader.desktop \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  sed -i 's|AdobeReader9.png|acroread|' \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  install -D -m644 Resource/Icons/64x64/AdobeReader9.png \
    "$pkgdir/usr/share/pixmaps/AdobeReader9.png" || return 1
  echo done
  
  msg2 "Installing License..."
  install -D -m644 Reader/Legal/fr_FR/License.txt \
    "$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
  echo done
}
