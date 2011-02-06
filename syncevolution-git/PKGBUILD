# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=syncevolution-git
_pkgname=syncevolution
pkgver=20090901
pkgrel=1
pkgdesc="A libsynthesis frontend"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('libsoup' 'evolution-data-server')
makedepends=('git')
provides=($_pkgname 'libsynthesis')
conflicts=($_pkgname 'libsynthesis')
_gitroot=git://git.moblin.org/${_pkgname}
_gitname=${_pkgname}
groups=('moblin-git')

build() {
  cd $startdir/src
  msg "Connecting to moblin.org git server...."
  rm  -rf $startdir/src/$_gitname-build

  if [[ -d $_gitname ]]; then
   cd $_gitname || return 1
   git pull origin || return 1
  else
   git clone $_gitroot $_gitname || return 1
  fi
  msg "Getting libsynthesis data"
  rm  -rf $startdir/src/libsynthesis-build

  cd $startdir/src
  if [[ -d libsynthesis ]]; then
   cd libsynthesis || return 1
   git pull origin || return 1
  else
   git clone git://git.moblin.org/libsynthesis libsynthesis || return 1
  fi
  msg "Checkout done"
  cd $srcdir || return 1
  cp -r libsynthesis libsynthesis-build
  cp -r $_gitname $_gitname-build

   cd $_gitname-build || return 1
    ./autogen.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-gui=moblin \
    --enable-dbus-service \
    --with-synthesis-src=$srcdir/libsynthesis-build || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
