# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Giulio Bai <giulio@hewle.com>

pkgname=accerciser-git
pkgver=20101026
pkgrel=1
pkgdesc="Interactive Python accessibility explorer for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Accerciser"
license=('BSD')
depends=('gnome-python-desktop>=2.14'
         'pygtk>=2.8'
	 'python2>=2.4'
	 'ipython'
	 'glib2>=2.10'
	 'at-spi2-core>=0.3.3'
	 'gconf')

makedepends=('git' 'automake' 'gnome-common' 'intltool')
conflicts=('accerciser')
source=()

_gitroot="git://git.gnome.org/accerciser"
_gitname="accerciser"

build () {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  # Change hard coded references of python to python2
  sed -i -e 's|env python|env python2|' src/accerciser.in
  sed -i -e 's|bin/python|bin/python2|' macaroon/*.in
  sed -i -e 's|bin/python|bin/python2|' macaroon/*.py
  sed -i -e 's|bin/python|bin/python2|' plugins/*.py
  PYTHON=python2 ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
  make DESTDIR=${pkgdir} install
  install -m 755 -d ${pkgdir}/usr/share/licenses/accerciser
  install -m 644 COPYING ${pkgdir}/usr/share/licenses/accerciser
}
