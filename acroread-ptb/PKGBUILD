# Contributor: Marcelo Cavalcante Rocha <kalib@archlinux-br.org>
# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>

pkgname=acroread-ptb
pkgver=8.1.6
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Portuguese version"
arch=('i686')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')
depends=('gtk2' 'bash' 'mesa')
makedepends=('rpmextract')
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/ptb/AdobeReader_ptb-${pkgver}-1.i486.rpm \
	acroread-scim.patch)
md5sums=('0bd8d47646221441b2098821be192eb0'
         '8422bddbb8c03535704a245f9858465e')

build() {
  cd ${startdir}/src
  rpmextract.sh AdobeReader_ptb-${pkgver}-1.i486.rpm
  cd opt/Adobe/Reader8

  patch -Np3 -i ${startdir}/src/acroread-scim.patch || return 1

  install -D -m644 Resource/Support/AdobeReader.desktop \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  sed -i 's/AdobeReader8.png/AdobeReader.png/' \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  install -D -m644 Resource/Icons/64x64/AdobeReader8.png \
    ${startdir}/pkg/usr/share/pixmaps/AdobeReader.png
  
  install -d ${startdir}/pkg/opt/acrobat
  cp -r Reader ${startdir}/pkg/opt/acrobat/
  cp -r Resource ${startdir}/pkg/opt/acrobat/

  install -D -m755 bin/acroread ${startdir}/pkg/opt/acrobat/bin/acroread
  install -d ${startdir}/pkg/usr/bin
  ln -sf /opt/acrobat/bin/acroread ${startdir}/pkg/usr/bin/acroread

  install -D -m755 Browser/intellinux/nppdf.so \
    ${startdir}/pkg/opt/mozilla/lib/plugins/nppdf.so

  install -D -m644 Reader/Legal/en_US/License.txt \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/License.txt
}
