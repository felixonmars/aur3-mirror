#########################################################################################################################
# Maintainer: aratmos OR argos-void <void.at.null AT gmail.com>. Usually at #archlinux IRC channel :)
#
# Since the Adobe Flash Player 10.2 update, everybody who used the /tmp trick weren't able to do it, because now
# Adobe writes the video file in the .mozilla folder, difficult to inspect. Thanks to :
#
# Enrique Molina <kique165@gmail.com>
# Carlos Alberto <elcazador_rca@yahoo.es>
# Esteban RM <exio4.com@gmail.com>
#
# who wrote the script contained in this package, now you can download any video from the Internet.
########################################################################################################################
pkgname=flash
pkgver=3.0
pkgrel=4
pkgdesc='Download videos from the Internet with the new "/tmp" trick.'
url="http://dl.dropbox.com/u/16585243/flash/index.html"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('bash' 'bzip2' 'tar' 'python' 'dialog')
optdepends=()
makedepends=()
conflicts=()
replaces=('flash=0.6')
backup=()
source=("http://dl.dropbox.com/u/16585243/files/flash/${pkgname}-${pkgver}.tar.bz2")
# md5sums were done in Tue 08/02/11
md5sums=('66c6f95ef54e1ca286ab807b4e7f8064')
build() {
  cd ${srcdir}
  tar xvf ${pkgname}-${pkgver}.tar.bz2
  cd ${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  cp flash ${pkgdir}/usr/bin
}
