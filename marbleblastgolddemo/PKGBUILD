# Maintainer: Gadget3000 <Gadget3000@man.com>
pkgname=marbleblastgolddemo
pkgver=1.4.1
pkgrel=2
pkgdesc="A 3D arcade action marble racing game demo."
arch=('i686' 'x86_64')
url="http://www.torquepowered.com/products/marbleblastgold"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-libvorbis' 'lib32-sdl')
	optdepends=('lib32-alsa-oss: Sound support')
else
	depends=('libvorbis' 'sdl')
	optdepends=('alsa-oss: Sound support')
fi
source=(http://demos.torquepowered.com/marbleblastgold/MarbleBlastGoldDemo-$pkgver.sh.bin)
md5sums=('556c7b1c051277ef8e9c0e1cc281d070')
install=(marbleblastgolddemo.install)

build() {
  cd $srcdir
  chmod +x MarbleBlastGoldDemo-$pkgver.sh.bin
  ./MarbleBlastGoldDemo-$pkgver.sh.bin --tar xvf -C $srcdir
  mkdir -p $pkgdir/opt/marbleblastgolddemo
  tar xvf MarbleBlast.tar.gz -C $pkgdir/opt/marbleblastgolddemo
  chown -Rh root:root ${pkgdir}/opt/marbleblastgolddemo
  rm -rf ${pkgdir}/opt/marbleblastgolddemo/lib
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/marbleblastgolddemo/marbleblastgolddemo $pkgdir/usr/bin/marbleblastgolddemo
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
