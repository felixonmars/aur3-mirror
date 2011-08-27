# Contributor: rpj8 (Factory) <semidigerati@gmail.com>

pkgname=rainslickep1
pkgver=r5
pkgrel=1
pkgdesc="On the Rain-Slick Precipice of Darkness is an episodic RPG-adventure game series set in a deranged comic-book meets-pulp-horror 1920s universe."
arch=('i686')
url="http://www.rainslick.com/"
license=('custom')
depends=('sdl' 'gcc-libs' 'libgl')
source=("http://download.playgreenhouse.com/${pkgname}_linux_$pkgver.tgz" "rainslickep1.desktop" )
md5sums=('3b337c38a7003633bb4048e6a3377764'
         '5d25c87ed92527f347bc3caa4c60467a')

build() {
  mkdir -p $startdir/pkg/usr/{bin,share/{$pkgname,pixmaps,applications}}
  cd $startdir/src
  cp -a rainslickep1/rainslick.png $startdir/pkg/usr/share/pixmaps/${pkgname}.png
  cp -a rainslickep1.desktop $startdir/pkg/usr/share/applications
  #old .sh method	
  #chmod +x rainslickep1.sh && cp rainslickep1.sh $startdir/pkg/usr/bin/rainslickep1.sh
  cp -a rainslickep1/* $startdir/pkg/usr/share/$pkgname
  ln -s $startdir/pkg/usr/share/rainslickep1/RainSlickEp1 $startdir/pkg/usr/bin/rainslickep1
}
