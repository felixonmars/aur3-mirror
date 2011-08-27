# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>
# Not sure if this is working yet - I'm not sure bout these secrets

pkgname=mojito-git
_pkgname=mojito
pkgver=20090905
pkgrel=1
pkgdesc="a social data store"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('librest-git' 'gnome-keyring')
makedepends=('libtool')
provides=($_pkgname)
conflicts=($_pkgname)
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
  msg " checkout done."
  cd $srcdir || return 1
  cp -r $_gitname $_gitname-build

   cd $_gitname-build || return 1

    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname \
    --with-online=connman \
    --with-gnome \
    --enable-twitter-key=4PEfS48BDCWSHSb1s84ebQ:HqJIWVVJwXNIMaNPuxkYw6wVTL2paNdWkvOg3mXxE \
    --enable-lastfm-key=b70f696913487a44ea13038e926a096a \
    --enable-myspace-key=f06906e7522f46f2a08a03e11ef66496:45ee30d3b29c47ffbb65b59bd84d1848bfa93c968b7d487cae68a6790e96c6ef \
    --enable-flickr-key=d7953dc63a9498433bfdb4287ee2694b:2bd799133e3a2c7f || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
