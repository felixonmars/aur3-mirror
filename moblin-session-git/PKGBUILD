# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=moblin-session-git
_pkgname=moblin-session
pkgver=20090809
pkgrel=1
pkgdesc="The script to make moblin into a session"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
_gitroot=git://git.moblin.org/${_pkgname}
_gitname=${_pkgname}
source=('mutter-plugins.patch')
md5sums=('ce6cc5c370ef21c5cabdde436c34508f')
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
  msg " checkout done."
  cd $srcdir || return 1
  cp -r $_gitname $_gitname-build
  patch -p0 < mutter-plugins.patch || return 1
   cd $_gitname-build || return 1
    make DESTDIR=$pkgdir install || return 1

    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
