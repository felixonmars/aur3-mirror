# Maintainer: peace4all <markspost at rocketmail dot com>
pkgname=rhythmbox-radio-browser-git
pkgver=20121120
pkgrel=1
pkgdesc="Internet radio browser plugin for rhythmbox"
url="https://github.com/fossfreedom/radio-browser"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox>=2.96' 'streamripper')
conflicts=('rhythmbox-radio-browser')

_gitroot="https://github.com/fossfreedom/radio-browser.git"
_gitname="radio-browser"

build () {
  cd ${srcdir}
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "GIT checkout done."
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname"
  mv README.md README
  cp -R {*.py,*.plugin,README} "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname/"

  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/$_gitname"
  cp -R {*.png,*.ui} "$pkgdir/usr/share/rhythmbox/plugins/$_gitname/"
}
