# Contributor: Jiri Prochazka <ojirio@gmail.com> 

pkgname=petri-foo-git
pkgver=20110810
pkgrel=1
pkgdesc='audio midi sampler, based on Specimen, for JACK'
url="http://petri-foo.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
install='petri-foo.install'
makedepends=('git')
depends=('jack' 'libgnomecanvas' 'desktop-file-utils')

_gitroot="git://github.com/jwm-art-net/Petri-Foo.git"
_gitname="Petri-Foo"

build() {
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

  # BUILD HERE

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUpdateMime=OFF .
  make
  make DESTDIR=${pkgdir} install
}

