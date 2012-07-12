pkgname='ostbuild-git'
pkgver='20120711'
pkgrel='1'
url='https://github.com/aperezdc/gnome-ostree/blob/master/README-build.md'
pkgdesc='The GNOME OS build tool (ostbuild)'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
provides=('ostbuild')
depends=('python2')
_gitroot='git://github.com/aperezdc/gnome-ostree.git'
_gitname='gnome-ostree'

build() {
	cd "$srcdir"

  msg "Connecting to the ostree git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir/$_gitname"

  msg2 "Configuring..."
	PYTHON=python2 ./autogen.sh --prefix=/usr
  msg2 "Compiling..."
	make
}

package() {
  cd "$srcdir/$_gitname"

  msg2 "Packaging..."
  make install PYTHON=python2 DESTDIR="$pkgdir"

	msg2 "Fix ostbuild Python script header"
	sed -i -e '1i#! /usr/bin/python2' "${pkgdir}/usr/bin/ostbuild"
}


