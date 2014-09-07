pkgname=frontdesign
pkgver=4.4.0
pkgrel=1
pkgdesc='With our free design software, you can customize your panel or enclosure based on your specifications.'
arch=('i686' 'x86_64')
license=('custom')
url='http://www.frontpanelexpress.com'
depends=('gtk2' 'pango' 'freetype2' 'atk' 'gdk-pixbuf2' 'fontconfig'
  'libpng12' 'libxext' 'libxrender' 'libxi' 'libxrandr' 'libxcursor' 'libxfixes'
  'libx11' 'glib2' 'libxinerama' 'zlib' 'gcc-libs' 'expat')
optdepends=('libjpeg6: for frontdesign-order')
options=('!emptydirs')

if [[ $CARCH == x86_64 ]]; then
  source=("http://www.frontpanelexpress.com/fileadmin/front-panel-designer-downloads/$pkgver/Linux/FrontDesign-US-$pkgver-amd64.deb")
  md5sums=('9985dc3a2d23d3bd24020c62706bbff0')
else
  source=("http://www.frontpanelexpress.com/fileadmin/front-panel-designer-downloads/$pkgver/Linux/FrontDesign-US-$pkgver-i386.deb")
  md5sums=('4a3fc5859f512915e0ab90adf74a8d88')
fi

build() {
  cd "${srcdir}"

  rm -rf files
  mkdir files
  tar xf data.tar.gz -C files/

  cd files
  mkdir -p usr/bin
  mv usr/local/bin/* usr/bin/
}

package() {
  cd "${srcdir}/files"

  cp -a opt usr "${pkgdir}"
}
