# Maintainer: shmilee.zju <shmilee.zju@gmail.com>
_branch=eden_src

pkgname=xbmc-addons-chinese-svn
pkgver=434
pkgrel=1
pkgdesc="XBMC add-ons from googlecode.xbmc-addons-chinese addon repository."
arch=('any')
url="http://code.google.com/p/xbmc-addons-chinese/"
license=('GPLv2')
depends=('xbmc')
makedepends=('subversion')
install=install
source=("svn+https://xbmc-addons-chinese.googlecode.com/svn/addons/$_branch")
md5sums=('SKIP')

pkgver() {
    cd "$SRCDEST/$_branch"
    svnversion | tr -d [A-z]
}

package() {
    cd ${srcdir}/$_branch
    rm addons.xml addons_xml_generator.py addons.xml.md5
    find . -type f -exec install -Dm644 {} ${pkgdir}/usr/share/xbmc/addons/{} \;
}
