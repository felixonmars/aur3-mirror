# A lxappearance that works for gtk2 and gtk3 - greygjhart

pkgname=lxappearance-gtk23
pkgver=20111201
pkgrel=1
pkgdesc="appearance manager for LXDE with (real) gtk-3.0 themes support"
url="http://pcmanfm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gtk3' 'glib2')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc')
provides=('lxappearance')
conflicts=('lxappearance')
replaces=()
source=(lxappearance.c.patch)
md5sums=('76baa58d4a7d5a4a083e6243da4f6956')

_gitroot="git://pcmanfm.git.sourceforge.net/gitroot/lxde/lxappearance"
_gitname="lxappearance"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d "$_gitname" ]
  then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  msg "Patching files"

  patch "$srcdir/$_gitname/src/lxappearance.c" < "$srcdir/lxappearance.c.patch"

  msg "Starting to build"

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc" --enable-man --enable-gtk3
  make
  make DESTDIR="${pkgdir}" install
}
