# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Marcelo Cavalcante Rocha <kalib@archlinux-br.org>
# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>

pkgname=acroread-ptb
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Portuguese version"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')

if [ $CARCH == x86_64 ]; then
  depends=('lib32-gtk2' 'bash' 'lib32-mesa' 'lib32-libgl' 'desktop-file-utils'
  	   'nspluginwrapper')
elif [ $CARCH == i686 ]; then
  depends=('gtk2' 'bash' 'mesa' 'libgl' 'desktop-file-utils')
fi
makedepends=('rpmextract')

install=${pkgname}.install
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/ptb/AdobeReader_ptb-${pkgver}-1.i486.rpm \
	acroread-scim.patch)
md5sums=('f0692f091cc498bf4a413215326e4198'
         '8422bddbb8c03535704a245f9858465e')

build() {
  cd ${srcdir}
  
  rpmextract.sh AdobeReader_ptb-${pkgver}-1.i486.rpm
  cd opt/Adobe/Reader8
  patch -Np3 -i ${srcdir}/acroread-scim.patch
}

package() {
  cd ${srcdir}/opt/Adobe/Reader8
  
  install -d "${pkgdir}/opt/acrobat"
  cp -r Reader "${pkgdir}/opt/acrobat"/
  cp -r Resource "${pkgdir}/opt/acrobat"/
  
  # binary
  install -D -m755 bin/acroread "${pkgdir}/opt/acrobat/bin/acroread"
  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/acrobat/bin/acroread "${pkgdir}/usr/bin/acroread"

  # firefox plugin
  if [ $CARCH == x86_64 ]; then
     nppdfdir=usr/lib32/mozilla/plugins
  elif [ $CARCH == i686 ]; then
     nppdfdir=usr/lib/mozilla/plugins
  fi
  install -D -m755 Browser/intellinux/nppdf.so \
    "${pkgdir}/${nppdfdir}/nppdf.so"

  # icon, .desktop, licenses
  install -D -m644 Resource/Support/AdobeReader.desktop \
    "${pkgdir}/usr/share/applications/AdobeReader.desktop"
  sed -i 's/AdobeReader8.png/AdobeReader.png/' \
    "${pkgdir}/usr/share/applications/AdobeReader.desktop"
  install -D -m644 Resource/Icons/96x96/AdobeReader8.png \
    "${pkgdir}/usr/share/pixmaps/AdobeReader.png"
  install -D -m644 Reader/Legal/en_US/License.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
