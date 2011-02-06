# Maintainer: elwin013 <kontakt AT elwin013 DOT com>
# Contributor: Jesses <jesse.jaara AT gmail DOT com>
# Contributor: Jiri Prochazka <ojirio AT gmail DOT com>
pkgname=daimonin-svn
pkgver=6022
pkgrel=1
pkgdesc="A SVN version of free, open source, Massively Multiplayer Online Role-playing Game (MMORPG)."
arch=(i686 x86_64)
url="http://www.daimonin.org/"
license=('GPL')
depends=('curl' 'sdl_image' 'sdl_mixer' 'physfs')
makedepends=('subversion')
source=(Makefile.am \
${pkgname}.desktop \
${pkgname}.png
${pkgname})
md5sums=('3a74c7bdf7aece45d3330c4bf3b18800'
         '0cebb50075d4f796508293989ad7004b'
         '7480f31868a20a4bce8fe940adc3c243'
         '8875cfb85900606ce08c214e303ffc44')

_svntrunk=https://daimonin.svn.sourceforge.net/svnroot/daimonin/trunk/client
_svnmod=client

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cp Makefile.am $srcdir/$_svnmod-build/make/linux/
  
  cd $srcdir/$_svnmod-build/make/linux
  ./bootstrap
  ./configure --prefix=/usr/share
  make
  msg "Make install"
  make DESTDIR="${pkgdir}" install
  
  mv $pkgdir/usr/share/daimonin $pkgdir/usr/share/daimonin-svn
  
  cd ../../
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install --mode=644 License $pkgdir/usr/share/licenses/$pkgname/License
  install --mode=644 media/License\ Note $pkgdir/usr/share/licenses/$pkgname/License\ Note
  install --mode=644 media/media.txt $pkgdir/usr/share/licenses/$pkgname/media.txt
  
  cd ../../
  mkdir -p $pkgdir/usr/bin
  install --mode=755 $pkgname $pkgdir/usr/bin/
  mkdir $pkgdir/usr/share/applications
  mkdir $pkgdir/usr/share/pixmaps
  install --mode=644 $pkgname.desktop $pkgdir/usr/share/applications/
  install --mode=644 $pkgname.png $pkgdir/usr/share/pixmaps/
}
