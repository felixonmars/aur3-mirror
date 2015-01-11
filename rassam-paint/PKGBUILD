pkgname=rassam-paint
pkgver=1.1
pkgrel=1
pkgdesc='Simple drawing program'
# binary is not available for x86_64 for 1.1 version
arch=(i686)
url='http://sourceforge.net/projects/rassampaint/'
license=(GPL LGPL)
depends=(gtk2)
# strip just produces an error
# strip: error: the input file './usr/bin/rassam-paint' has no sections
options=(!strip)
source=(http://downloads.sourceforge.net/rassampaint/${pkgname}_${pkgver}_32bit.tar.gz
        ${pkgname}.desktop
        drawing.svg)
md5sums=('e4fa1520ddc7d8ffb161f8b9da4691b3'
         '7fcd736a7a6fb9c8e339066f82eda1c2'
         '1b8d942a395a80e4a441923dd215598a')

package() {
  cd ${srcdir}

  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # this was downloaded from 
  # 'http://sourceforge.net/p/rassampaint/code/ci/master/tree/cur/drawing.svg?format=raw' 
  # and autocropped using 
  # `inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileClose *.svg`
  install -D -m 644 ${srcdir}/drawing.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
