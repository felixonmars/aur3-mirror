# Contributor: Andreas Baumann <abaumann at yahoo dot com>
pkgname=ner-git
pkgver=20130620
pkgrel=1
pkgdesc="ner is a notmuch based email client."
license=('GPL3')
arch=('i686' 'x86_64')
url="http://the-ner.org/"
depends=('glib2' 'gmime' 'yaml-cpp0.3' 'ncurses')
makedepends=('git' 'autoconf' 'automake')
_gitroot=git://git.the-ner.org/ner.git
_gitname=ner

package() {
  cd $startdir/src/$_gitname-build

  make DESTDIR=${pkgdir} install
}

build() {
  cd $startdir/src
  
  msg "Getting source from git..."
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  ./autogen.sh
  ./configure --prefix=/usr
  make
}
