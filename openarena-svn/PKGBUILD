# Maintainer: Simone Sclavi 'Ito <darkhado@gmail.com>
pkgname=openarena-svn
pkgver=951
pkgrel=1
pkgdesc="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine (latest development version)"
arch=('i686' 'x86_64')
url="http://www.openarena.ws"
license=('GPL')
depends=('sdl' 'libvorbis' 'curl' 'openal')
makedepends=('subversion' 'zip')
source=("svn+http://openarena.ws/svn/")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/svn"
  svnversion | tr -d [A-z]
}
build() {
  cd "$SRCDEST/svn"
  sh buildmodsnix.sh
  sh buildmppk3nx.sh
  sh buildoppk3nix.sh
  sh buildpk3nix.sh
}

package() {
  cd "$SRCDEST/svn"
  mkdir -p $pkgdir/usr/share/${pkgname}/{baseoa,missionpack}
  mv mp-pak0.pk3 $pkgdir/usr/share/${pkgname}/missionpack
  install -m644 *.pk3 $pkgdir/usr/share/${pkgname}/baseoa

 [ "$CARCH" = x86_64 ] && cd bin/release-linux-x86_64
 [ "$CARCH" = i686 ] && cd bin/release-linux-i386
 install -m755 * $pkgdir/usr/share/${pkgname}

 local OABIN=$pkgname
 echo "#!/bin/sh" >> $OABIN
 echo "cd /usr/share/${pkgname}" >> $OABIN
 [ "$CARCH" = x86_64 ] && echo "./openarena.x86_64" >> $OABIN
 [ "$CARCH" = i686 ] && echo "./openarena.i386" >> $OABIN
 
 install -Dm755 $OABIN $pkgdir/usr/bin/${OABIN}
 rm -f $OABIN
}

