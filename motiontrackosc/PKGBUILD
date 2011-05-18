# Contributor: Bjoern Lindig <bjoern dot lindig at googlemail dot com>
pkgname=motiontrackosc
pkgver=0.2a
pkgrel=1
pkgdesc="A small program that does motiontracking on either a camera image or a video file. The tracked motion is output to a client via osc."
arch=(i686 x86_64)
url="http://www.nescivi.nl/?page_id=93"
license=('GPL')
groups=()
depends=('liblo' 'opencv')
makedepends=('scons')
optdepends=()
provides=('motiontrackosc')
conflicts=('motiontrackosc')
replaces=('motiontrackosc')
backup=()
options=()
install=
source=(http://www.nescivi.nl/$pkgname/MotionTrackOSC.$pkgver.tbz2 $pkgname.patch)
noextract=()
md5sums=() #generate with 'makepkg -g'
 
build() {
  cd "$srcdir/MotionTrackOSC.$pkgver"
 
  patch < ${srcdir}/${pkgname}.patch || return 1
  mkdir -p ${pkgdir}/usr/bin
  scons PREFIX=/usr/ || return 1
  #### uncomment the following two lines for the SuperCollider Classes
  #mkdir -p ${pkgdir}/usr/share/SuperCollider/Extensions/ || return 1
  #scons PREFIX=${pkgdir}/usr SCPATH=${pkgdir}/usr/share/SuperCollider/Extensions/ DESTDIR=${pkgdir}/ install || return 1
  scons PREFIX=${pkgdir}/usr/ DESTDIR=${pkgdir}/ install || return 1
}
 
# vim:set ts=2 sw=2 et:
md5sums=('c4921c18df0750edea195ddb6ae14f8f'
         '69bba7951a6268caa0cf9bdad9109e5a')
