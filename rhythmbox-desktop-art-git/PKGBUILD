# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox-desktop-art-git
_gitname="desktop-art"
pkgver=9ce4a8e
pkgrel=1
pkgdesc="rhythmbox v3.0.x plugin to display the coverart and control rhythmbox from your desktop"
url="https://github.com/fossfreedom/desktop-art"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('git')
depends=('rhythmbox>=3.0' 'gtk3' 'gobject-introspection' 'librsvg')
source=("$_gitname::git+https://github.com/fossfreedom/desktop-art.git"
	"remove-cairo-fix.patch")
md5sums=('SKIP'
	 '33886e83065801abbf2891bc91502bb5')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -Np1 -i "${srcdir}/remove-cairo-fix.patch"
}


package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/${_gitname}"
  mv README.md README
  mv LICENSE.txt LICENSE
  mv ${_gitname}.plugin3 ${_gitname}.plugin
  cp -R {*.py,*.plugin,README,LICENSE} "$pkgdir/usr/lib/rhythmbox/plugins/${_gitname}/"
  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/${_gitname}"
  cp -R *.ui "$pkgdir/usr/share/rhythmbox/plugins/${_gitname}/"
}
