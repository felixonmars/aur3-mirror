# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=gnumeric-git
pkgver=20120105
pkgrel=1
pkgdesc="A GNOME Spreadsheet Program (Git version)"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
conflicts=('gnumeric')
depends=('goffice-git' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gnome-doc-utils' 'python2-gobject2' 'psiconv')
optdepends=('python2-gobject2: for python plugin support'
            'psiconv: for Psion 5 file support')
install=gnumeric-git.install
options=('!libtool')

_gitroot="git://git.gnome.org/gnumeric"
_gitname="gnumeric"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile --enable-ssindex
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}

