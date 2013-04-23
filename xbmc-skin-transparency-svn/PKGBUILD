# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
_svntrunk=http://transparency-xbmc.googlecode.com/svn/trunk
_svnmod=Transparency

pkgname=xbmc-skin-transparency-svn
pkgver=1472
pkgrel=1
pkgdesc='XBMC fanart skin by ronie'
arch=('any')
url='http://code.google.com/p/transparency-xbmc/'
license=('GPL')
depends=('xbmc-git>=20130414')
makedepends=('subversion')
conflicts=('xbmc-skin-transparency')
source=("${_svnmod}::svn+http://transparency-xbmc.googlecode.com/svn/trunk")
md5sums=('SKIP')

pkgver() {
	  cd "${SRCDEST}/${_svnmod}"
	  svnversion | tr -d [A-z]
}

package() {
	  mkdir -p "${pkgdir}/usr/share/xbmc/addons/skin.transparency"
	  cp -r "${srcdir}/${_svnmod}"/* "${pkgdir}/usr/share/xbmc/addons/skin.transparency"
	  # Remove SVN leftovers.
	  find "${pkgdir}" -type d -name .svn -exec rm -r '{}' +
}
