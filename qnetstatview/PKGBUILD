# Contributer: giacomogiorgianni@gmail.com 

pkgname=qnetstatview
pkgver=1.2.0
pkgrel=2
pkgdesc="Qt program that will show you detailed listings of all TCP and UDP endpoints on your system, including the local and remote addresses and state of TCP connections"
arch=(i686 x86_64)
url="https://opendesktop.org/content/show.php/QNetStatView?content=157088&PHPSESSID=a14d9a115efc59d8aa9a1502b597dfdc"
license=('GPL3')
depends=('qt4' 'imagemagick')
#source=("https://opendesktop.org/CONTENT/content-files/157088-${pkgname}_source.tar.gz")
source=("http://dansoft.krasnokamensk.ru/data/1016/${pkgname}_source.tar.gz"
        "${pkgname}.desktop")
md5sums=('58fcaade7843c2d84adf5c9e66b1abf3'
         'ecaaf54ba6524e07f1edcc57b89cdbce')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}_source"

  qmake-qt4 ${pkgname}.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=${pkgname}"
  make
  
  # create and install icons
  for N in 16 32 48 64 128; do convert ${pkgname}.ico -scale ${N}x${N}! $N.png; done

}

package() {
  install -D -m755 ${srcdir}/${pkgname}_source/Bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m644 ${srcdir}/${pkgname}_source/Bin/${pkgname}_ru.qm ${pkgdir}/usr/share/${pkgname}/${pkgname}_ru.qm
  install -D -m644 ${startdir}/${pkgname}.desktop  ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D ${srcdir}/${pkgname}_source/16.png -m 644 ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png
  install -D ${srcdir}/${pkgname}_source/32.png -m 644 ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png
  install -D ${srcdir}/${pkgname}_source/48.png -m 644 ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png
  install -D ${srcdir}/${pkgname}_source/64.png -m 644 ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  install -D ${srcdir}/${pkgname}_source/128.png -m 644 ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
}
