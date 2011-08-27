# Maintainer: max_meyer

pkgname=virtualbricks-bzr
pkgver=298
pkgrel=1
pkgdesc="An all in one Virtualisation solution available for the Linux desktop"
arch=(any)
url="http://virtualbricks.eu/"
license=('GPL')
depends=('gnome-python-extras' 'python2' 'libglade' 'python-pygraphviz' 'python-imaging')
makedepends=('bzr')
provides=(virtualbricks)
conflicts=(virtualbricks)
#replaces=()
#backup=()
options=('!libtool' '!emptydirs')
#install=
source=(patch-virtualbricks-bin.patch )
#noextract=()
md5sums=('83d4f0cab3961a7be044a651875dcc9e') #generate with 'makepkg -g'

_bzrtrunk="http://bazaar.launchpad.net/~virtualbricks/virtualbrick/main"
_bzrmod="virtualbrick"

PYTHON="/usr/bin/python2"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  $PYTHON setup.py build
  cat ./share/virtualbricks.template.glade | sed -e "s/___VERSION___/$pkgver/g" > share/virtualbricks.glade
  patch "./main/virtualbricks" "$startdir/patch-virtualbricks-bin.patch"

}

package() {
  cd "$srcdir/$_bzrmod-build"
  $PYTHON setup.py install --prefix=/usr/ --root=$pkgdir/ --optimize=1
} 
