# Contributor: Sylvain HENRY <hsyl20@gmail.com>
# Maintainer: Augusto Rocha Elesbão <aelesbao@gmail.com>

pkgname=ensime
pkgver=0.9.8.9
scalaver=2.10.0
pkgrel=3
pkgdesc="ENSIME is the ENhanced Scala Interaction Mode for Emacs"
arch=("any")
url="http://aemon.com/file_dump/ensime_manual.html"
license=("GPL")
depends=("emacs" "scala>=${scalaver}")
install="ensime.install"

source=("https://www.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_${scalaver}-${pkgver}.tar.gz")
md5sums=("427b6dae65fdbe67551ce3e19a4a2c16")

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O')

build(){

  mkdir -p ${pkgdir}/usr/share/ensime
  cp -r ${srcdir}/ensime_${scalaver}-${pkgver}/* ${pkgdir}/usr/share/ensime/

  chmod o+x ${pkgdir}/usr/share/ensime/bin/server
  rm ${pkgdir}/usr/share/ensime/bin/server.bat


}
