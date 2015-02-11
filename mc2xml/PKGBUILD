# Contributor: queue <queueRAM@gmail.com>

# NOTE: manually download mc2xml from URL above and place in this directory

pkgname=mc2xml
pkgver=1.3
pkgrel=1
pkgdesc="Media Center TV Listings to XMLTV.xml for mythtv"
arch=('i686' 'x86_64')
url="http://mc2xml.awardspace.info/"
license=('unknown')
depends=()
options=('!strip')
source=(file://${pkgname})
md5sums=('3b612d906f295ea822abadeaf43727b0')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
