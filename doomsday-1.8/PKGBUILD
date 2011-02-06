# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Dmitry Shilov <stormblast@land.ru>
pkgname=doomsday-1.8
pkgver=1.8.6
pkgrel=1
pkgdesc="An engine for playing games based on DooM"
url="http://www.doomsdayhq.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_net' 'sdl_mixer' 'openal' 'libgl' 'libpng' 'mesa')
provides=("doomsday=$pkgver")
conflicts=('doomsday')
makedepends=('gcc3')
optdepends=('timidity++: for enabling midi music playback on audio cards without hardware midi support')
options=('!libtool')
source=(http://downloads.sourceforge.net/deng/deng-$pkgver.tar.gz
        doomsday.{directory,menu}
	doomsday-j{doom,heretic,hexen}.png
        j{doom{,2{,-plutonia,-tnt}},heretic,hexen}.{sh,desktop})
md5sums=('1717d0de5bc8efba9076d6b8e2055d08'
         '19d5c02d03dcaf57a0dbc2d6c4419ea5'
         'd804098c841ef9e61d93b8b8af8cb56c'
         '6835c2c84909688be425850088d7a58a'
         '0f839385115bd3284b9ec73b0295b2d8'
         'a735a86abc76e706faf2499b94ae3f1c'
         'ea00f461334c058701e7cf57d313592b'
         '099a19ede56ada8417e2437c22b74165'
         '713d2632fb4a5a460a72d40fb3dab983'
         '75abe89124fe1418e8966ee1399070d6'
         'f9b8f535890973203d87bbf21f278438'
         '9686ae304ef6890cb96a193faddbf360'
         'f9ce519c3bc056a7cec7ea4811fa6d9a'
         '4be43c8132c15eeafe5c6ba3bda58ef7'
         'e6ac3457465a39054d55ff3d254f5398'
         '1a7d4f56ac55f9e2f30729141559bd31'
         'a2ac0d3259abd0b4e41f881e82e0f8f3'
         '4d476aa77cab357cb2d2bb232bb12826')

build() {
  cd $srcdir/deng-$pkgver/Build
  export CFLAGS=${CFLAGS//-mtune=generic/}
  export CXXFLAGS=${CXXFLAGS//-mtune=generic/}
  CC=gcc-3.3 CXX=g++-3.3 ../configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -d -m755 $pkgdir/usr/share/{applications,desktop-directories,pixmaps}
  install -m644 $srcdir/j*.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/doomsday.directory $pkgdir/usr/share/desktop-directories
  install -m644 $srcdir/doomsday-j*.png $pkgdir/usr/share/pixmaps
  install -m644 $srcdir/deng-$pkgver/Data/Graphics/Logo.png $pkgdir/usr/share/pixmaps/doomsday.png

  cd $srcdir
  for _i in *.sh; do
    install -m755 $_i $pkgdir/usr/bin/${_i%.sh};
  done

  install -d -m755 $pkgdir/etc/xdg/menus/{,kde-}applications-merged
  install -m644 $srcdir/doomsday.menu $pkgdir/etc/xdg/menus/applications-merged
  ln -s ../applications-merged/doomsday.menu $pkgdir/etc/xdg/menus/kde-applications-merged
}
