# Maintainer: Wido <widowild [at] myopera [dot] com>

pkgname=botmu
pkgver=1.0.0
pkgrel=1
pkgdesc="petit logiciel qui permet de lancer une liste de téléchargements via megaupload"
url="http://botmu.sourceforge.net/"
license=('GPL3')
arch=('any')
options=()
depends=('python2' 'pyqt' 'libpcap' 'gstreamer0.10-python')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-Sources-v${pkgver}.tar.gz ${pkgname}.sh ${pkgname}.desktop)
md5sums=('c8e4fac2521c763b99bb28147e37e2b9'
         '83368192aa72ae0b04baa32ce91a6394'
         'c11bfc5ad4b79361c7ea3dc41f4a4c34')

build() {
   cd ${srcdir}
   install -d ${pkgdir}/usr/share/botmu
   cp -R ${srcdir}/BotMU/* ${pkgdir}/usr/share/botmu
}

package(){
  cd ${srcdir}

  # Install Launcher
   install -Dm 755 ${srcdir}/${pkgname}.sh \
       ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
   install -Dm 644 ${srcdir}/${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
