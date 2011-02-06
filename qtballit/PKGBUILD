# Contributor:Xemertix <arch88(at)katamail(dot)com>
# WinBallit is available in italian,english,german while Qtballit is available only in italian and german.
# The program's manual will be opened with firefox,this maybe changed in makefile.patch

pkgname=qtballit
pkgver=0.1
pkgrel=1
depends=('qt3')
pkgdesc="The linux version of WinBallit ballistic calculator"
url="http://www.earmi.it/download/winballit.htm"
arch=("i686" "x86_64")
license=('GPL')
source=(http://slack.isper.sk/pub/slackware-13.0/utilities/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.gz
        makefile.patch
        qtballit.desktop)
    
md5sums=('f1a17d18f06d9db3bce528e4ed626b5d'
         '40b2d0f2925d491c97b706c67e085294'
         '6d9710c8f541e1821a25b8266b6f53e0')

build() {
  cd ${srcdir}/${pkgname}

  patch -p0 < ${srcdir}/makefile.patch || return 1

  make || return 1
  install -D -m 755 Qtballit ${pkgdir}/usr/bin/qtballit

  mkdir -p ${pkgdir}/usr/share/{${pkgname},${pkgname}/i18n}
  cp -a *.png ${pkgdir}/usr/share/${pkgname}
  cp -a qtballit_de.qm ${pkgdir}/usr/share/${pkgname}/i18n

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -a *.htm COPYING INSTALL ${pkgdir}/usr/share/doc/${pkgname}

  install -D -m 664 ${srcdir}/qtballit.desktop ${pkgdir}/usr/share/applications/qtballit.desktop
}
