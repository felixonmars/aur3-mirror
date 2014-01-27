# Maintainer: Mathieu Westphal <mathieu.westphal@gmail.com>

_pkgname=mcpixel
_hibname=McPixel
pkgname="${_pkgname}-swf"
_hibver=1372117132
pkgver=1.0.20140126
pkgrel=1
pkgdesc="McPixel is a save-the-day guy that you guide through short challenges in an oldschool point'n'click fashion. (swf version)"
arch=(any)
url='http://mcpixel.net/'
license=('custom: "commercial"')
depends=('flashplayer-standalone')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://${_hibname}_${_hibver}.tar.gz"
        "${pkgname}.sh")
package() {
    cd "$srcdir"
    install -Dm644 "${_hibname}".swf "${pkgdir}/opt/${_pkgname}.swf"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
                }


# vim:set ts=2 sw=2 et:
md5sums=('9da770ac57c9a3617ccebf486d41d55a'
         'f38cd851c64cc5a7c1c0ada823b630d2')
