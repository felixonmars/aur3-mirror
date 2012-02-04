pkgname=bin32-acroread-es
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Spanish version"
arch=('x86_64')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')
depends=('lib32-glibc' 'lib32-gtk2' 'lib32-pcre' 'lib32-libstdc++5' 'bash')
makedepends=(rpmextract patch)
install=(nsplugin.install)
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/esp/AdobeReader_esp-${pkgver}-1.i486.rpm \
	acroread-scim.patch \
	acroread-lib32.patch)
md5sums=('517af4a798ac1ab894fa220af8d93718'
         '883defb8133c3bb4a62d6b08d58df03b'
         '6d82d8a44f1f91667488b9c913f038db')

build() {
  cd ${startdir}/src
  rpmextract.sh AdobeReader_esp-${pkgver}-1.i486.rpm
  cd opt/Adobe/Reader8

  patch -Np3 -i ${startdir}/acroread-scim.patch || return 1
  # Tell acroread to look for gconv libs in our lib32
  patch -Np3 -i ${startdir}/acroread-lib32.patch || return 1

  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/applications
  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  mkdir -p ${startdir}/pkg/opt/acrobat/bin
    
  install -D -m644 Resource/Support/AdobeReader.desktop \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  sed -i 's/AdobeReader8.png/AdobeReader.png/' \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  install -D -m644 Resource/Icons/64x64/AdobeReader8.png \
    ${startdir}/pkg/usr/share/pixmaps/AdobeReader.png
    
  install -d ${startdir}/pkg/opt/acrobat
  cp -r Reader ${startdir}/pkg/opt/acrobat/
  cp -r Resource ${startdir}/pkg/opt/acrobat/

  install -m755 bin/acroread ${startdir}/pkg/opt/acrobat/bin/
  ln -sf ../../opt/acrobat/bin/acroread ${startdir}/pkg/usr/bin/acroread

  # Put the plugins where nspluginwrapper can find them
  install -m755 -D Browser/intellinux/nppdf.so \
    ${startdir}/pkg/usr/lib/mozilla/plugins/nppdf.so

  install -D -m644 Reader/Legal/es_ES/License.txt \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/License.txt

  find ${startdir}/pkg -type d -exec chmod 755 {} \;
}
