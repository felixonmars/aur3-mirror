# Maintainer: Jynko <jayson at it-linux dot com>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>


pkgname=openglad
pkgver=0.98
pkgrel=2
pkgdesc="SDL port of an old DOS game called Gladiator"
arch=(i686)
url="http://snowstorm.sourceforge.net/"
license=('GPL')
depends=('sdl_mixer')
source=(http://sourceforge.net/projects/snowstorm/files/OpenGlad/Openglad-0.98/$pkgname-$pkgver.tar.gz/download
	openglad_48x48.png
	openglad.desktop
	cfix.patch)

md5sums=('e211c0ba876a75215dd99f7925783ea4'
	 '2783d3a5742957e42e3ca79f9161658b'
	 '57e172d99a2ed4d2fe85b05707fe90eb'
	 '43ea59144fe0d3a9af1d6ad8a2b63a1f') 

build() {
  # Desktop icons
  install -Dm644 openglad_48x48.png $pkgdir/usr/share/pixmaps/openglad_48x48.png
  install -Dm644 openglad.desktop $pkgdir/usr/share/applications/openglad.desktop	
  install -Dm644 $srcdir/$pkgname-$pkgver/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd $srcdir/$pkgname-$pkgver
  patch -p0 < ../../cfix.patch
  ./configure --prefix=/usr --bindir=/usr/bin --datadir=/usr/share/openglad
  make || return 1
  make DESTDIR=$pkgdir install
}
