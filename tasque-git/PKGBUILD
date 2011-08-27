#Contributor: kasa <biuta.jr@gmail.com>
#Contributor: Yuanhao Li

pkgname=tasque-git
pkgver=20101005
pkgrel=1
pkgdesc="Simple Task Manager for the Linux Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://live.gnome.org/Tasque"
depends=('gnome-sharp' 'gnome-common' 'notify-sharp-svn' 'sqlite3' 'evolution-data-server' 'evolution-sharp')
makedepends=('intltool' 'pkgconfig' 'gettext')
replaces=('tasky')
options=('!libtool')
conflicts=('tasque')
install=$pkgname.install
_gitroot="git://git.gnome.org/tasque"
_gitname="tasque"

build() {
  msg "Connecting to gnome git server..."
  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated. "
  else
    git clone $_gitroot
  fi

  msg "Git checkout done."
  msg "Starting make..."

  if [ -d "$srcdir/$_gitname-build" ]; then
      rm -r "$srcdir/$_gitname-build"
  fi
  cp -r "$srcdir/$_gitname" "$startdir/src/$_gitname-build"

  export MONO_SHARED_DIR=${srcdir}/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd "$srcdir/$_gitname-build"
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
--enable-backend-rtm --enable-backend-eds \
--enable-backend-sqlite --enable-backend-dummy || return 1
  make || return 1
  make DESTDIR=${pkgdir} GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install

  mkdir -p ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
md5sums=('')

