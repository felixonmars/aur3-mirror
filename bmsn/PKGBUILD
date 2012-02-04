#########################################################################################################################
# Maintainer: aratmos OR argos-void <void.at.null AT gmail.com>. Usually at #archlinux IRC channel :)
# Coder: Enrique Molina <kique165@gmail.com>
#########################################################################################################################
pkgname=bmsn
pkgver=1.5
pkgrel=1
_pkgname2=mb
_pkgver2=0.1
pkgdesc='a simple bash script that allows a conversation locally through a file that stores talks.'

url="http://dl.dropbox.com/u/16585243/bmsn/index.html"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('bash' 'bzip2' 'tar' 'openssh' 'sshfs')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://dl.dropbox.com/u/16585243/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
 "http://dl.dropbox.com/u/16585243/files/${pkgname}/${_pkgname2}-${_pkgver2}.tar.bz2")
# md5sums were done in Tue 06/21/11
md5sums=('195546890ea1ecf706fafc64027905c8'
'd5ee51d568b747c05298ff2c1ff4866a')
build() {
  tar xfv ${pkgname}-${pkgver}.tar.bz2 &> /dev/null
  mkdir ${pkgdir}/usr/bin -p
  cp -rf bmsn/bmsn ${pkgdir}/usr/bin
  cp -rf bmsn/bmsetup ${pkgdir}/usr/bin
  cp -rf bmsn/refresh ${pkgdir}/usr/bin

  tar xfv ${_pkgname2}-${_pkgver2}.tar.bz2 &> /dev/null
  cp -rf mb/mb ${pkgdir}/usr/bin
  cp -rf mb/mw ${pkgdir}/usr/bin
  cp -rf mb/mbsetup ${pkgdir}/usr/bin
  cd ${pkgdir}/usr/bin
  ln -s mb/mb m
  ln -s mb/mw b
}
