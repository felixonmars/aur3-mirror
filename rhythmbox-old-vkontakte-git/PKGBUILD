# Maintainer: Gerasev Kirill <gerasev.kirill@gamil.com>
pkgname=rhythmbox-old-vkontakte-git
pkgver=0.1
pkgrel=1
pkgdesc="Search, browse and listen to vkontakte music"
url="https://github.com/gerasev-kirill"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox-old' 'pywebkitgtk')

_gitroot="https://github.com/gerasev-kirill/rhythmbox-vkontakte.git"
_gitname="rhythmbox-vkontakte"

build () {
  cd ${srcdir}
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone --depth 1  ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "GIT checkout done."
}

package() {
  cd "${srcdir}/${_gitname}/src"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname"
  cp -R {*.py,*plugin,*.ui,*.png} "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname/"
}
