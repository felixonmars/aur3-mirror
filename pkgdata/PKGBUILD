# Contributor: Markku <rasat@user-contributions.org>

pkgname=pkgdata
pkgver=0.61.1
pkgrel=1
pkgdesc="Arch Linux Package Data."

url="http://user-contributions.org/projects/pkgdata"
depends=('bash' 'wget')

source=(http://user-contributions.org/projects/pkgdata/src/$pkgname-$pkgver.tar.gz)
md5sums=('5d1d689ea9f0feac9d4ff85694e22757')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cp -R $startdir/src/$pkgname-$pkgver/usr $startdir/pkg/ || return 1
}

