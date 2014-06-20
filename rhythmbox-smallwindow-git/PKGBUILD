# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox-smallwindow-git
_gitname="smallwindow"
pkgver=25ca2c6
pkgrel=1
pkgdesc="Brings back rhythmbox small window mode."
url="https://github.com/fossfreedom/smallwindow"
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('git')
depends=('rhythmbox>=3.0')
source=("$_gitname::git+https://github.com/fossfreedom/smallwindow.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
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
