# Contributors: Mladen Pejaković <pejakm@gmail.com>

_realname=slimrat
pkgname=${_realname}-gui
_realver=1.1-beta2
pkgver=1.1_beta2
pkgrel=1
pkgdesc="GUI for slimrat, an application for automated downloading from file hosters like Rapidshare, Megaupload, Depositfiles and many more"
url="http://code.google.com/p/slimrat"
license=('MIT')
arch=('any' )
depends=('slimrat' 'glade-perl' 'xclip')
optdepends=('tesseract:    		for OCR solving'
            'imagemagick:  	for pass to ImageMagick convert binary')

backup=()
install=slimrat-gui.install
source=(http://slimrat.googlecode.com/files/${_realname}-${_realver}.tar.bz2 \
	slimrat-gui.desktop)

md5sums=('ed244022741611f7d587016280e94263'
         '40ba8c07e07499a537279f2f4409f4ac')

build() {
  cd ${srcdir}/${_realname}-${_realver}
  install -m 755 -d ${pkgdir}/usr/lib/slimrat ${pkgdir}/usr/bin
  install -m 755 -D src/${pkgname} ${pkgdir}/usr/lib/${_realname}/
  install -m 644 -D src/Clipboard.pm ${pkgdir}/usr/lib/${_realname}/
  install -m 644 -D src/${_realname}.glade ${pkgdir}/usr/lib/${_realname}/
  install -m 644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 644 -D icon/icon-slimrat.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/slimrat.svg
  install -m 644 -D icon/icon-slimrat-16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/slimrat.png
  install -m 644 -D icon/icon-slimrat-48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/slimrat.png
  install -m 644 -D icon/icon-slimrat-128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/slimrat.png
  ln -s /usr/lib/slimrat/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

