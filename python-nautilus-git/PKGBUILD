# Maintainer: Fabien LOISON <flo@flogisoft.com>
pkgname=python-nautilus-git
pkgver=20111008
pkgrel=3
pkgdesc="Python binding for Nautilus components, Git version."
arch=('i686' 'x86_64')
url="http://projects.gnome.org/nautilus-python/"
license=('GPL2')
depends=('nautilus' 'python2' 'python2-gobject')
makedepends=('gnome-common' 'gtk-doc')
optdepends=('python2-gconf: required for open-terminal and background-image examples')
conflicts=('python-nautilus')
options=('!libtool' '!emptydirs')

_giturl="git://git.gnome.org/nautilus-python"


build() {
  cd ${srcdir}

  #Download the soruce from the git repository
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${pkgname} ]] ; then
    cd ${pkgname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_giturl} ${pkgname}
    cd ${pkgname}
    git checkout nautilus-3.0
  fi
  msg "GIT checkout done."

  #Build
  export PYTHON=python2
  ./autogen.sh --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 et:
