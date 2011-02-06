pkgname=aegisub
pkgver=4809
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.net"
license=('GPL' 'BSD')
depends=('intltool' 'ffmpeg>=23619' 'lua' 'openal' 'wxgtk>=2.8.11' 'hunspell')
makedepends=('imagemagick>=6.6.2.10' 'pkg-config')
optdepends=('asa: for subtitle rendering'
            'libass: for subtitle rendering')
#options=(!libtool)
source=(aegisub-2.1.8-as_needed.patch dist.patch license.txt)

_svntrunk=http://svn.aegisub.org/branches/aegisub_2.1.9/aegisub
_svnmod=aegisub


md5sums=('e42833e4acca069a8d13b95f57954aed'
         'fce9fb182e9701ee3be3d41eb08df43f'
         '3e13350007702bd7117e8f35bac376f1')

build() {
  cd $srcdir
  
  if [ -d $_svnmod ]; then
    cd $_svnmod && svn revert -R . && svn up
  else
    svn co $_svntrunk $_svnmod
  fi  
  
  cd $srcdir/$_svnmod
  
  patch -Np0 -i $srcdir/aegisub-2.1.8-as_needed.patch

  ./autogen.sh

  patch -Np0 -i $srcdir/dist.patch

  sed -i 's/cv_agi_with_ffmpeg/with_ffmpeg/' configure
  CPPFLAGS="-D__STDC_CONSTANT_MACROS"  ./configure --prefix=/usr \
  --with-player-audio=openal --without-{portaudio,alsa,oss} || return 1

  make || return 1
}

package() {
  cd ${srcdir}/$_svnmod
  make DESTDIR=$pkgdir install || return 1

  # menu icon fix
  sed -i 's/Icon=aegisub/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/aegisub.svg/' $pkgdir/usr/share/applications/aegisub.desktop || return 1

  # install the BSD license, although it is ruled by GPL according to the wiki:
  # (http://www.malakith.net/aegiwiki/Subtitling_software_comparison)
  install -D -m644 "$srcdir"/license.txt \
      "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
