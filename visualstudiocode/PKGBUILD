# Maintainer: Craig Cabrey <craigcabrey@gmail.com>
pkgname=('visualstudiocode')
pkgver=0.1.0
pkgrel=3
pkgdesc='Lightweight code editor by Microsoft.'
source=('http://download.microsoft.com/download/0/D/5/0D57186C-834B-463A-AECB-BC55A8E466AE/VSCode-linux-x64.zip'
        'visualstudiocode.desktop')
depends=('cairo' 'gtk2' 'gconf' 'libxtst')
arch=('x86_64')
url='https://code.visualstudio.com'
license=('custom')
md5sums=('50d4547e3617ace370f040edace6d7cd'
         'b7a9b98828e3bfbc5695704356a3e0f0')

package_visualstudiocode() {
  install -d ${pkgdir}/opt/visualstudiocode
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons

  install -m644 visualstudiocode.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m644 ${srcdir}/resources/app/vso.png ${pkgdir}/usr/share/icons/${pkgname}.png

  cp -a ${srcdir}/* ${pkgdir}/opt/visualstudiocode
  ln -s /opt/${pkgname}/Code "${pkgdir}"/usr/bin/visualstudiocode
}
