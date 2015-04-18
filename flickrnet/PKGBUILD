# $Id: PKGBUILD 126495 2015-01-24 10:15:59Z andrea $
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>
pkgname=flickrnet
pkgver=3.14.0
_gitver=48b9321f
pkgrel=1
pkgdesc="Flickr.Net API Library"
arch=('any')
url="http://www.codeplex.com/FlickrNet"
license=('LGPL')
depends=('mono')
makedepends=('git')
source=($pkgname-$pkgver::git+https://github.com/samjudson/flickr-net.git#commit=$_gitver
        $pkgname.pc)
md5sums=('SKIP'
         '131dd6e01f99c0533e9367b5cfda3a13')

prepare() {
  sed -i "s/@VERSION@/$pkgver/" "$srcdir/$pkgname.pc"
}

build() {
  cd $pkgname-$pkgver/FlickrNet
  xbuild /property:Configuration=Release FlickrNet.csproj
}

package() {
  cd $pkgname-$pkgver/FlickrNet
  gacutil -i bin/Release/FlickrNet.dll -package $pkgname-$pkgver -root "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/$pkgname.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
}
