# Maintainer: elwin013 <kontakt AT elwin013 DOT com>
# Contributor: Jesses <jesse.jaara AT gmail DOT com>
# Contributor: robb_force <robb_force AT holybuffalo DOT net>
pkgname=daimonin
pkgver=0.10.5
pkgrel=9
pkgdesc="A free, open source, Massively Multiplayer Online Role-playing Game (MMORPG)."
arch=('i686' 'x86_64')
url="http://www.daimonin.org"
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'physfs' 'curl')
source=(http://sourceforge.net/projects/${pkgname}/files/Sources/client-${pkgver}.tar.gz/download  \
${pkgname}.desktop \
${pkgname}.png \
makefile.patch \
daimonin)
md5sums=('f170e5128007389b98e254e72c412817'
         'a910ade3a5c18cd9dd3fb156b4bea57a'
         '7480f31868a20a4bce8fe940adc3c243'
         '867ddba1a7dc7f90d03aec2fe92f7a2c'
         'e45328fe741bdc94751eee9bd3f29bee')
build() {
  patch -d $srcdir/client/make/linux < makefile.patch
  mkdir -p $pkgdir/opt
  
  cd "$srcdir/client/make/linux"
  ./bootstrap
  ./configure --prefix=/opt
  make
  make DESTDIR="${pkgdir}" install
  
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
