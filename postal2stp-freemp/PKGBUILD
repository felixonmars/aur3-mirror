# Contributor: rabyte <rabyte*gmail>

pkgname=postal2stp-freemp
pkgver=1409.2
pkgrel=5
pkgdesc='Freeware multiplayer edition of "Postal 2: Share The Pain"'
arch=('i686' 'x86_64')
url="http://icculus.org/news/news.php?id=4419"
license=('custom')
depends=('gcc-libs' 'libstdc++5' 'xorg-server')
[ "$CARCH" = "x86_64" ] && depends=('lib32-gcc-libs' 'lib32-libstdc++5' 'xorg-server')
source=(http://treefort.icculus.org/postal2/Postal2STP-FreeMP-linux.tar.bz2 \
	$pkgname.sh \
	$pkgname.desktop)
md5sums=('eb40b2ddfec31062639e1c942949f524'
         '1e5ec64cbef7f14b16e6f4e6837312a0'
         'bd886391ed0d420622de64dadc5f5401')

build() {
  cd Postal2STP-FreeMP-linux

  mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
  mv -f $pkgname-license.txt $pkgdir/usr/share/licenses/$pkgname/
  mv -f postal2.xpm $pkgdir/usr/share/pixmaps/
  cp -rf . $pkgdir/usr/share/$pkgname/
  install -m755 -D ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m644 ../$pkgname.desktop $pkgdir/usr/share/applications/

  find $pkgdir -name '*.so*' -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
