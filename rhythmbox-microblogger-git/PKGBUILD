# Maintainer: peace4all <markspost at rocketmail dot com>
pkgname=rhythmbox-microblogger-git
pkgver=20121207
pkgrel=1
pkgdesc="send notice to your microblogging service from Rhythmbox"
url="https://github.com/aliva/rhythmbox-microblogger"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox>=2.9' 'python2-httplib2' 'python2-gconf')
install=$pkgname.install
conflicts=('rhythmbox-microblogger')

_plugin=microblogger
_gitroot="https://github.com/aliva/rhythmbox-microblogger.git"
_gitname="rhythmbox-$_plugin"

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
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_plugin"
  mv README.md README
  cp -R {*.py,*.plugin,oauth2,README} "$pkgdir/usr/lib/rhythmbox/plugins/$_plugin/"

  mkdir -p "$pkgdir/usr/share/glib-2.0/schemas/"
  cp -R *.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/"

  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/$_plugin/"
  cp -R *.ui "$pkgdir/usr/share/rhythmbox/plugins/$_plugin/"
}
