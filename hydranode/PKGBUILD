#Contributor: Troll <gnu.troll@gmail.com>
pkgname=hydranode
pkgver=0.3
pkgrel=1
pkgdesc="Bittorrent/Edonkey Client"
url="http://hydranode.com/"
license="GPL"
depends=('qt4>=4.0')
install=hydranode.install
source=(http://puzzle.dl.sourceforge.net/sourceforge/hydranode/$pkgname-$pkgver-r2998-linux.tar.bz2 hydranode hydranode.png hydranode.desktop)
md5sums=('14e79f3e97b7da45bdc48bcc2f2136e5')

build() {
  cd $startdir/src/$pkgname-$pkgver/

  mkdir -p $startdir/pkg/opt/$pkgname-$pkgver/
  mkdir -p $startdir/pkg/opt/$pkgname-$pkgver/backgrounds/plugins
  mkdir -p $startdir/pkg/opt/$pkgname-$pkgver/doc
  mkdir -p $startdir/pkg/opt/$pkgname-$pkgver/lib
  mkdir -p $startdir/pkg/opt/$pkgname-$pkgver/plugins

# Install executable

  install -m 755 $startdir/src/$pkgname-$pkgver/hlink $startdir/pkg/opt/$pkgname-$pkgver/
  install -m 755 $startdir/src/$pkgname-$pkgver/hydranode $startdir/pkg/opt/$pkgname-$pkgver/
  install -m 755 $startdir/src/$pkgname-$pkgver/hydranode-core $startdir/pkg/opt/$pkgname-$pkgver/

# Install other files

  install -m 644 $startdir/src/$pkgname-$pkgver/backgrounds/plugins/donkeyserverbar.png $startdir/pkg/opt/$pkgname-$pkgver/backgrounds/plugins/
  install -m 644 $startdir/src/$pkgname-$pkgver/backgrounds/*.png $startdir/pkg/opt/$pkgname-$pkgver/backgrounds/
  install -m 644 $startdir/src/$pkgname-$pkgver/doc/* $startdir/pkg/opt/$pkgname-$pkgver/doc/
  install -m 644 $startdir/src/$pkgname-$pkgver/lib/* $startdir/pkg/opt/$pkgname-$pkgver/lib
  install -m 644 $startdir/src/$pkgname-$pkgver/plugins/* $startdir/pkg/opt/$pkgname-$pkgver/plugins

# Install .desktop file
  mkdir -p $startdir/pkg/usr/share/applications
  install -m 644 $startdir/$pkgname.desktop $startdir/pkg/usr/share/applications/

# Install icon
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -m 644 $startdir/$pkgname.png $startdir/pkg/usr/share/pixmaps/

# Install script
  mkdir -p $startdir/pkg/usr/bin/
  install -m 755 $startdir/hydranode $startdir/pkg/usr/bin/
}
