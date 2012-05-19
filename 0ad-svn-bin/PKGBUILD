# Maintainer: Ner0

pkgname=0ad-svn-bin
pkgver=11863
_pkgver=r$pkgver-4.2
_dataver=r$pkgver-1.1
pkgrel=3
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game (openSUSE SVN prebuilt)"
url="http://wildfiregames.com/0ad"
arch=('i686' 'x86_64')
_arch='x86_64'
[ $CARCH = 'i686' ] && _arch='i586'
license=('GPL2' 'CCPL')
depends=('boost-libs' 'curl' 'enet' 'gamin' 'libogg' 'libpng14' 'libvorbis' 'libxml2' 'openal' 'python2' 'sdl' 'zlib')
makedepends=('boost' 'libarchive' 'wget' 'lynx')
conflicts=('0ad' '0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
options=('!emptydirs')
source=(http://download.opensuse.org/repositories/games/openSUSE_Factory/$_arch/0ad-$_pkgver.$_arch.rpm
	http://download.opensuse.org/repositories/games/openSUSE_Factory/noarch/0ad-data-$_dataver.noarch.rpm)
md5sums=(`wget ${source[0]}.md5 -qO - | cut -d " " -f1`
         `wget ${source[1]}.md5 -qO - | cut -d " " -f1`)

PKGEXT='.pkg.tar'

package() {
  mv -f usr/share/doc/{packages/0ad,0ad}
  rm -rf usr/share/doc/packages
  
  if [ $CARCH = 'x86_64' ]; then
    sed -i 's|/usr|LD_LIBRARY_PATH=/usr/lib64/0ad /usr|' usr/bin/0ad
  else
    sed -i 's|/usr|LD_LIBRARY_PATH=/usr/lib/0ad /usr|' usr/bin/0ad
  fi

  # Linking Boost libs
  if [ ! -f /usr/lib/libboost_system.so.1.46.1 ]; then
    cd usr/lib*/0ad
    ln -fs `find /usr/lib -type f -name libboost_system.so.1.\* -print 2>/dev/null | head -n 1` libboost_system.so.1.46.1
  fi

  # Native libjpeg6
  cd "$srcdir"
  wget `lynx -dump http://download.opensuse.org/distribution/openSUSE-stable/repo/oss/suse/$_arch/ | grep -o \
	http.*libjpeg62-[0-9].*rpm | tail -1` -qO - | bsdtar -xf -
  mv -f usr/lib*/libjpeg.so* usr/lib*/0ad
  
  mv -f "$srcdir/usr" "$pkgdir/"
}
