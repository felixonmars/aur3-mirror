# Maintainer: lucio zara <pennega@gmail.com>

pkgname=virtviewer-git
_pkgname=virtviewer
pkgver=20111220
pkgrel=1
pkgdesc="A lightweight interface for interacting with the graphical display of virtualized guest OS."
depends=('gtk-vnc' 'libglade>=2.6.0' 'libvirt')
makedepends=('intltool' 'git')
url="http://virt-manager.et.redhat.com"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('virtviewer')
provides=('virtviewer')

_gitroot=git://git.fedorahosted.org/git/virt-viewer.git
_gitname=virt-viewer

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname-build"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."


  cd $_gitname-build
  export LDFLAGS=-lX11
  ./autogen.sh	
  ./configure --prefix=/usr
  make

}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

