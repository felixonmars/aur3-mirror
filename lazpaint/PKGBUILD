# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgbase=lazpaint
pkgname=lazpaint
true && pkgname=(lazpaint-gtk2 lazpaint-qt4)
pkgver=5.6
_inetver=0.6.6
_bgrabitmapver=7.2
_bgracontrolsver=2.2
pkgrel=1
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal).'
arch=(i686 x86_64)
url='http://sourceforge.net/projects/lazpaint/'
license=(GPL3 LGPL)
makedepends=(lazarus gtk2 qt4pas unzip)
provides=($pkgbase)
install=$pkgbase.install
source=(http://downloads.sourceforge.net/project/${pkgbase}/src/${pkgbase}${pkgver}_src.zip
        http://downloads.sourceforge.net/project/${pkgbase}/src/inet${_inetver}.zip
        http://downloads.sourceforge.net/project/${pkgbase}/src/bgrabitmap${_bgrabitmapver}.zip
        http://downloads.sourceforge.net/project/bgracontrols/bgracontrols-${_bgracontrolsver}.zip
        ${pkgbase}.desktop
        ${pkgbase}.png
        language_path_fix.patch
        constref_update.patch)
md5sums=(3c8805ccf641e31a04d0124cc35adc29
         63e9ae30886fdd3ee309a12bdc0ff613
         29e496ae174d3b7f09802fea523468bb
         c34b93ddb087ca8e647447dce6a8176e
         e6f4f8c4d9456b21ed4a25d7b775fec4
         8f26062ad1e3222d375201d96341716c
         4938510815fa494acdf9104603c237a2
         d05b17d67506853ff1ec0d93803661da)

prepare() {
  cd ${srcdir}

  patch -p0 < language_path_fix.patch
  patch -p0 < constref_update.patch

  mkdir config-gtk2
  mkdir config-qt

  for ws in gtk2 qt; do
    cp -a ${pkgbase}${pkgver} ${pkgbase}${pkgver}-${ws}
    cp -a inet${_inetver} inet${_inetver}-${ws}
    cp -a bgrabitmap${_bgrabitmapver} bgrabitmap${_bgrabitmapver}-${ws}
    cp -a bgracontrols-${_bgracontrolsver} bgracontrols-${_bgracontrolsver}-${ws}
  done
}

build() {
  for ws in gtk2 qt; do
    cd ${srcdir}/inet${_inetver}-${ws}/lazaruspackage
    lazbuild lnetvisual.lpk --lazarusdir=/usr/lib/lazarus \
      --primary-config-path=${srcdir}/config-${ws} --widgetset=${ws}
    cd ${srcdir}/bgrabitmap${_bgrabitmapver}-${ws}
    lazbuild bgrabitmappack.lpk --lazarusdir=/usr/lib/lazarus \
      --primary-config-path=${srcdir}/config-${ws} --widgetset=${ws}
    cd ${srcdir}/bgracontrols-${_bgracontrolsver}-${ws}
    lazbuild bgracontrols.lpk --lazarusdir=/usr/lib/lazarus \
      --primary-config-path=${srcdir}/config-${ws} --widgetset=${ws}
    cd ${srcdir}/${pkgbase}${pkgver}-${ws}
    lazbuild ${pkgbase}.lpi --lazarusdir=/usr/lib/lazarus \
      --primary-config-path=${srcdir}/config-${ws} --widgetset=${ws}
  done
}

make_package() {
  cd release

  install -D -m 755 ${pkgbase} ${pkgdir}/usr/bin/${pkgbase}
  install -d -m 755 ${pkgdir}/usr/share/${pkgbase}/i18n
  install -D -m 644 i18n/*.po ${pkgdir}/usr/share/${pkgbase}/i18n

  install -D -m 644 ${srcdir}/${pkgbase}.desktop \
    ${pkgdir}/usr/share/applications/${pkgbase}.desktop
  install -D -m 644 ${srcdir}/${pkgbase}.png \
    ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
}

package_lazpaint-gtk2() {
  depends=(gtk2 desktop-file-utils)
  conflicts=(${pkgbase}-qt4)

  cd ${srcdir}/${pkgbase}${pkgver}-gtk2
  make_package
}

package_lazpaint-qt4() {
  depends=(qt4pas)
  conflicts=(${pkgbase}-gtk2)

  cd ${srcdir}/${pkgbase}${pkgver}-qt
  make_package
}
