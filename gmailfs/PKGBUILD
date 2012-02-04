# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname='gmailfs'
pkgver=8.6
_pkgver=8
pkgrel=1
pkgdesc="GMail Filesystem over FUSE"
arch=('any')
license=('GPL')
depends=('python2' 'python-fuse' 'libgmail-cvs')
url="http://sr71.net/projects/$pkgname"
source=(http://sr71.net/projects/$pkgname/$pkgname.py-v$_pkgver http://sr71.net/projects/$pkgname/$pkgname.conf $pkgname-python27.patch)
#source=(gmailfs.conf) local config
backup=(etc/$pkgname/$pkgname.conf)
md5sums=('886c95caf2a408c4cdc5b82a8c8d4fbb'
         '838c607895855bb13f7f59185e6cd68e'
         'aa54cdc2f8f423f0f01f1ec3d48e203b')

build() {
  cd "$srcdir"
  patch -i $pkgname-python27.patch
  install -Dm755 $pkgname.py-v$_pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname/$pkgname.conf"
}
