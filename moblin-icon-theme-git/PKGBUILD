# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=moblin-icon-theme-git
_pkgname=moblin-icon-theme
pkgver=20090622
pkgrel=1
pkgdesc="The Moblin default icon theme"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('icon-naming-utils' 'hicolor-icon-theme')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
_gitroot=git://git.moblin.org/${_pkgname}
_gitname=${_pkgname}

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

   cd $_gitname-build || return 1
   ./create-icon-theme.sh moblin
   install -d m755 $pkgdir/usr/share/icons/moblin/
   cp -r ./output/moblin/* $pkgdir/usr/share/icons/moblin/
    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
