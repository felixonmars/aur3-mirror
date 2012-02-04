# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=moblin-panel-media-git
_pkgname=moblin-panel-media
pkgver=20090905
pkgrel=1
pkgdesc="The media player panel for moblin (AKA ahoghill)"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=()
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
_gitroot=git://git.moblin.org/${_pkgname}
_gitname=${_pkgname}
groups=('moblin-git')
#source=(new-clutter.patch)
#md5sums=('1e125b73382ef20f91f89c60068758bf')

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

    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--libexecdir=/usr/lib/moblin-panel || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
