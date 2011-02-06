# Contributor: Luca Cesari <mirshann@gmail.com>

pkgname=eclipse-coloreditor-plugin
pkgver=1.2.6
pkgrel=1
pkgdesc="A syntax color highlighting editor for Eclipse. ColorEditor uses JEdit's syntax highlighting mode files."
url="http://gstaff.org/colorEditor/"
license=('custom')

arch=('i686' 'x86_64')
depends=('eclipse')

source=("http://gstaff.org/colorEditor/cbg.editor_${pkgver}.jar")
noextract=("cbg.editor_${pkgver}.jar")
md5sums=('ad95be6d581850d0584246e7a1c4b0a9')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/eclipse/plugins
  cp -f cbg.editor_${pkgver}.jar ${pkgdir}/usr/share/eclipse/plugins || return 1
}		

