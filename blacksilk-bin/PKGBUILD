# Maintainer: kfgz <kfgz at interia dot pl>

pkgname=blacksilk-bin
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
pkgdesc="an intuitive black and white conversion software with focus on a responsive user interface and workflow"
url="http://fd-imaging.com/apps-2/blacksilk-bw-toolkit/"
license=('custom')
depends=('mesa-libgl' 'libxext')
source=(http://fd-imaging.com/files/blacksilk/releases/BlackSilk.Standalone.${pkgver}-beta.linux.zip
        blacksilk
        blacksilk.desktop)
md5sums=('2c423f3bcb35c7d474b75e641d0ff9b9'
         '07e1210f30ff7805a379232c0547bf62'
         '9f6782857f9f592920f3475c597b55aa')

package() {
  install -m755 -D blacksilk "${pkgdir}"/usr/bin/blacksilk
  install -m644 -D blacksilk.desktop "${pkgdir}"/usr/share/applications/blacksilk.desktop
  install -dm755 "${pkgdir}"/opt/${pkgname}
  cd "${srcdir}"/BlackSilk.Standalone.${pkgver}-beta.linux
  mv * "${pkgdir}"/opt/${pkgname}
}
