
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=acroread-fi
pkgver=8.1.7
pkgrel=1
pkgdesc="Adobe Reader on Adoben PDF tiedosto katselin. i686/x86_6"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/reader/"
license=('custom')
options=('!strip')
install=acroread.install
source=("http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/suo/AdobeReader_suo-${pkgver}-1.i486.tar.bz2" acroread-lib32.patch)
md5sums=(
'b803660b8ce49b1b51426a77e5c88e3d'
'6d82d8a44f1f91667488b9c913f038db')

if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-gtk2' 'lib32-mesa' 'desktop-file-utils')
else
    depends=('gtk2' 'mesa' 'desktop-file-utils')
fi

build() {
  cd "$srcdir/AdobeReader"
  bsdtar -xf COMMON.TAR || return 1
  bsdtar -xf ILINXR.TAR || return 1
  cd Adobe/Reader8

  ## i686 ##
  if [ "$CARCH" = "i686" ]; then

  mkdir -p "$pkgdir/usr/lib/acroread" || return 1
  cp -a * "$pkgdir/usr/lib/acroread" || return 1

  mkdir -p "$pkgdir/usr/bin" || return 1
  ln -s /usr/lib/acroread/bin/acroread "$pkgdir/usr/bin" || return 1

  mkdir -p "$pkgdir/usr/lib/mozilla/plugins" || return 1
  ln -s /usr/lib/acroread/Browser/intellinux/nppdf.so "$pkgdir/usr/lib/mozilla/plugins" || return 1

  ## x86_64 ##
  else

  # Tell acroread to look for gconv libs in our lib32
  patch -Np3 -i ${startdir}/acroread-lib32.patch || return 1

  install -d ${startdir}/pkg/opt/acroread/bin
  cp -r Reader ${startdir}/pkg/opt/acroread/
  cp -r Resource ${startdir}/pkg/opt/acroread/

  install -m755 bin/acroread ${startdir}/pkg/opt/acroread/bin/

  mkdir -p "$pkgdir/usr/bin" || return 1
  ln -s /opt/acroread/bin/acroread "$pkgdir/usr/bin" || return 1
  
  # Put the plugins where nspluginwrapper can find them
  install -m755 -D Browser/intellinux/nppdf.so \
    ${startdir}/pkg/usr/lib/mozilla/plugins/nppdf.so

  fi

  install -D -m644 Resource/Support/AdobeReader.desktop \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  sed -i 's|AdobeReader8.png|acroread|' \
    "$pkgdir/usr/share/applications/acroread.desktop" || return 1
  install -D -m644 Resource/Icons/192x192/AdobeReader8.png \
    "$pkgdir/usr/share/pixmaps/acroread.png" || return 1

  install -D -m644 Reader/Legal/fi_FI/License.txt \
    "$pkgdir/usr/share/licenses/acroread/License.txt" || return 1
}
