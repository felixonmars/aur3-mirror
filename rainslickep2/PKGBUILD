# Contributor: rpj8 (Factory) <semidigerati@gmail.com>

pkgname=rainslickep2
pkgver=r3
pkgrel=1
pkgdesc="On the Rain-Slick Precipice of Darkness is an episodic RPG-adventure game series set in a deranged comic-book meets-pulp-horror 1920s universe."
arch=('i686')
url="http://www.rainslick.com/"
license=('GPL')
depends=('sdl' 'gcc-libs' 'libgl')
source=("http://download.playgreenhouse.com/hotheadgames/rainslick/${pkgname}_linux_$pkgver.tgz" "rainslickep2.desktop" )
_pkgname=RainSlickEp2
md5sums=('f4b36a0955d8345122091363946cba78' '645e07d05b0f378741bb26a7a4710533')

build() {
  mkdir -p $startdir/pkg/usr/{bin,share/{$pkgname,pixmaps,applications,licenses/$pkgname}}
  cd $startdir/src
  cp -a ${_pkgname}/* $startdir/pkg/usr/share/$pkgname
  cp $_pkgname/rainslick.png $startdir/pkg/usr/share/pixmaps/rainslick2.png
  cp $_pkgname/eula.html $startdir/pkg/usr/share/licenses/${pkgname}/LICENSE
  cp ${pkgname}.desktop $startdir/pkg/usr/share/applications
  #old .sh method	
  #chmod +x rainslickep1.sh && cp rainslickep1.sh $startdir/pkg/usr/bin/rainslickep1.sh
  #ln -s $startdir/pkg/usr/share/rainslickep1/RainSlickEp1 $startdir/pkg/usr/bin/rainslickep1
  echo -e "#!/bin/bash\n/usr/share/${pkgname}/RainSlickEp2" > $startdir/pkg/usr/bin/$pkgname
  chmod +x $startdir/pkg/usr/bin/$pkgname
}
