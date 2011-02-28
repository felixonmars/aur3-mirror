pkgname=aegisub
pkgver=5376
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.net"
license=('GPL' 'BSD')
depends=('intltool' 'ffmpeg>=23619' 'lua' 'openal' 'wxgtk>=2.8.11' 'hunspell' 'libidn')
makedepends=('imagemagick>=6.6.2.10' 'pkg-config' 'subversion')
optdepends=('asa: for subtitle rendering'
            'libass: for subtitle rendering')
source=(license.txt)
md5sums=('3e13350007702bd7117e8f35bac376f1')

_svntrunk=http://svn.aegisub.org/branches/aegisub_2.1.9/aegisub
_svnmod=aegisub


build() {
  cd $srcdir
  
  if [ -d $_svnmod ]; then
    cd $_svnmod && svn up
  else
    svn co $_svntrunk $_svnmod
  fi

  if [ -d $srcdir/$_svnmod-build ]; then
    rm -rf $srcdir/$_svnmod-build
  fi

  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  
  cd $srcdir/$_svnmod-build
  
  ./autogen.sh
  ICONV_LIBS="-lidn" ./configure --prefix=/usr \
  --with-player-audio=openal --without-{portaudio,alsa,oss} || return 1

  make || return 1
}

package() {
  cd ${srcdir}/$_svnmod-build
  make DESTDIR=$pkgdir install || return 1

  # menu icon fix
  sed -i 's/Icon=aegisub/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/aegisub.svg/' $pkgdir/usr/share/applications/aegisub.desktop || return 1

  # install the BSD license, although it is ruled by GPL according to the wiki:
  # (http://www.malakith.net/aegiwiki/Subtitling_software_comparison)
  install -D -m644 "$srcdir"/license.txt \
      "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
