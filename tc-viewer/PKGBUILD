# Maintainer: kfgz <kfgz at interia pl>

pkgname=tc-viewer
pkgver=1.5
pkgrel=1
pkgdesc="tc-viewer provides the ability to watch current transfers that take place in HTB and HFSC traffic shaping classes."
arch=('any')
url="http://freshmeat.net/projects/tcv/"
license=('GPL')
depends=('perl')
noextract=(${pkgname}-${pkgver}-1.noarch.rpm)
source=(ftp://ftp.pbone.net/mirror/ftp.pld-linux.org/dists/3.0/PLD/noarch/RPMS/${pkgname}-${pkgver}-1.noarch.rpm)
md5sums=('e68d9f959bc877be2cd4d06d81221929')

package() {
  cd "${pkgdir}"
  bsdtar xvf "${startdir}/${pkgname}-${pkgver}-1.noarch.rpm"
}
