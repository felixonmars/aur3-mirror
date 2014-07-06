# Maintainer: Dave Blair <mail@dave-blair.de>

pkgname='google-musicmanager-beta'
pkgver='1.0.117.4968'
pkgrel='3'
pkgdesc='Uploads and downloads music to and from your Google Play music cloud'
arch=('i686' 'x86_64')
url='https://play.google.com/music/listen#/now'
license=('custom:google')
depends=('libid3tag'
         'flac'
         'gcc-libs-multilib'
         'libvorbis'
         'libidn'
         'qtwebkit')
source=(license.html::http://www.google.com/intl/en/policies/terms/index.html)
sha256sums=('SKIP') 
if [ "$CARCH" == "x86_64" ]; then
  source+=("http://dl.google.com/linux/musicmanager/deb/pool/main/g/google-musicmanager-beta/${pkgname}_${pkgver}-r0_amd64.deb")
  sha256sums+=('0efdce3970e2cf83eb7d8f6021f987a1517a41823784ada8e51f1649f8a49342')
else
  source+=("http://dl.google.com/linux/musicmanager/deb/pool/main/g/google-musicmanager-beta/${pkgname}_${pkgver}-r0_i386.deb")
  sha256sums+=('4cc8822ab90af97195c2edfa74cc8b4a736e763cc3382f741aa1de0f72ac211e')
fi
source+=("google-musicmanager.desktop")
sha256sums+=('566910d9eedd8c8ca54716f2117ca0920af1da0f25659476202fc4c7b24b27bb')

build() {
  mkdir -p "${srcdir}/build"
  bsdtar -xf "data.tar.lzma" -C "${srcdir}/build"
}

package() {
  cp -a "${srcdir}/build/opt" "${pkgdir}/opt"
  cp -a "${srcdir}/build/usr" "${pkgdir}/usr"
  rm -r "${pkgdir}/usr/share/man"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp -a "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -a "${srcdir}/build/opt/google/musicmanager/product_logo_128.png" \
        "${pkgdir}/usr/share/icons/google-musicmanager.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp -a "google-musicmanager.desktop" "${pkgdir}/usr/share/applications/"
}
