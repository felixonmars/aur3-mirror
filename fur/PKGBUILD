# Contributor: Vinzenz Vietzke <vinz@archlinux.us>

pkgname=fur
pkgver=0.4.5
pkgrel=1
pkgdesc="FUR for FUSE is a Windows CE based device shares filesystem"
arch=('i686')
url="http://www.infis.univ.trieste.it/~riccardo"
license=('GPL')
depends=('fuse' 'synce-librapi')
source=(http://www.infis.univ.trieste.it/~riccardo/FUR-$pkgver.tar.gz)
md5sums=('efe43cda7d50ed71810e9b284d89bde1')

build() {
  cd FUR-$pkgver
  sed -i -e "s/-lrapi/-lrapi -lsynce/g" ./configure
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/sbin
  install -m 755 Fur $startdir/pkg/sbin/mount.fur
}
