pkgname=0ad-bin
pkgver=alpha_7
_pkgver=r10288-2.20
_dataver=r10288-1.2
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game (openSUSE prebuilt)"
url="http://wildfiregames.com/0ad"
arch=('i686' 'x86_64')
license=('GPL2' 'CCPL')
depends=('boost-libs' 'curl' 'enet' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'openal' 'python2' 'sdl' 'wxgtk' 'zip' 'zlib' 'libjpeg6')
makedepends=('boost' 'libarchive')
conflicts=('0ad' '0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=(http://download.opensuse.org/repositories/games/openSUSE_Factory/x86_64/0ad-$_pkgver.x86_64.rpm
	http://download.opensuse.org/repositories/games/openSUSE_Factory/noarch/0ad-data-$_dataver.noarch.rpm)
[ $CARCH = 'i686' ] && source[0]=http://download.opensuse.org/repositories/games/openSUSE_Factory/i586/0ad-r10288-2.21.i586.rpm
md5sums=(`wget ${source[0]}.md5 -qO - | cut -d " " -f1`
         `wget ${source[1]}.md5 -qO - | cut -d " " -f1`)

package() {
  mv -f usr/share/doc/{packages/0ad,0ad}
  rm -rf usr/share/doc/packages

  if [ ! -f /usr/lib/libboost_system.so.1.46.1 ]; then
    cd usr/lib*/0ad
    ln -fs /usr/lib/libboost_system.so.1.* libboost_system.so.1.46.1
  fi

  mv -f "$srcdir/usr" "$pkgdir/"
}
