pkgname=0ad-bin
pkgver=alpha_7
_pkgver=r10288-2.23
_dataver=r10288-1.2
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game (openSUSE prebuilt)"
url="http://wildfiregames.com/0ad"
arch=('i686' 'x86_64')
_arch='x86_64'
[ $CARCH = 'i686' ] && _arch='i586'
license=('GPL2' 'CCPL')
depends=('boost-libs' 'curl' 'enet' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'openal' 'python2' 'sdl' 'wxgtk' 'zip' 'zlib' 'libjpeg6')
makedepends=('boost' 'libarchive')
conflicts=('0ad' '0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=(http://download.opensuse.org/repositories/games/openSUSE_Factory/$_arch/0ad-$_pkgver.$_arch.rpm
	http://download.opensuse.org/repositories/games/openSUSE_Factory/noarch/0ad-data-$_dataver.noarch.rpm)
md5sums=(`wget ${source[0]}.md5 -qO - | cut -d " " -f1`
         `wget ${source[1]}.md5 -qO - | cut -d " " -f1`)

package() {
  mv -f usr/share/doc/{packages/0ad,0ad}
  rm -rf usr/share/doc/packages

  if [ ! -f /usr/lib/libboost_system.so.1.46.1 ]; then
    cd usr/lib*/0ad
    ln -fs `find /usr/lib -type f -name libboost_system.so.1.\* -print 2>/dev/null | head -n 1` libboost_system.so.1.46.1
  fi

  mv -f "$srcdir/usr" "$pkgdir/"
}
