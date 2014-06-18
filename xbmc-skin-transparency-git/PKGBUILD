# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>

_gitname='transparency'

pkgname=xbmc-skin-transparency-git
pkgver=r18.e176087
pkgrel=1
pkgdesc="XBMC fanart skin by ronie"
arch=('any')
url="https://github.com/ronie/skin.transparency/"
license=('GPL')
depends=('xbmc-git>=20140616')
makedepends=('git')
conflicts=('xbmc-skin-transparency' 'xbmc-skin-transparency-svn')
replaces=('xbmc-skin-transparency-svn')
source=("${_gitname}::git+https://github.com/ronie/skin.transparency.git#branch=master")
md5sums=('SKIP') #generate with 'makepkg -g'


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/skin.transparency"
  cp -r "${srcdir}/${_gitname}"/* "${pkgdir}/usr/share/xbmc/addons/skin.transparency"
  # Remove SVN leftovers.
  #find "${pkgdir}" -type d -name .svn -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
