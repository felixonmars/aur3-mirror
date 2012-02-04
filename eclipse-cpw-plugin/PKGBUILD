# Contributor: Luca Cesari <mirshann@gmail.com>

pkgname=eclipse-cpw-plugin
pkgver=1.3.0
pkgrel=2
pkgdesc="Copyright Wizard is a plugin to implement a copyright comment on the header of files of a project. The wizard lets you set the text of the comment and select the source files on which to applied it"
url="http://www.wdev91.com/?p=cpw"
license=('EPL')

arch=('i686' 'x86_64')
depends=('eclipse>=3.4')

source=("http://www.wdev91.com/download.php?copyright-wizard-${pkgver}.zip")
md5sums=('f795ce2f48a8374c6820e9d30fd61158')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/eclipse/dropins/copyright/eclipse
  cp -rf features plugins ${pkgdir}/usr/share/eclipse/dropins/copyright/eclipse
}		

