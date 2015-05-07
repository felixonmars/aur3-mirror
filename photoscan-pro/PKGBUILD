# Maintainer: Fincer <fincer89 at hotmail dot com>
pkgname=photoscan-pro
pkgver=1.1.6
ver=1_1_6
pkgrel=1
pkgdesc='Generate high resolution georeferenced orthophotos and textured polygonal models (trial version).'
arch=('x86_64')
url='http://www.agisoft.com/'
license=('custom: "commercial"')
depends=("libpng12")
install=photoscan-pro.install
  architecture=_amd64
  source=("http://download.agisoft.com/photoscan-pro_$ver$_$architecture.tar.gz" "$pkgname.runtime" "$pkgname.png" "$pkgname.desktop")
md5sums=('b735813065b218aac9f0b91d79d1f43f'
         '2f29afffc98fa39ae0f5c47fe7195833'
         '9ffa07f3059edce837d43de8c2a50e1b'
         '72403a878fd2f555ce5d3bef507740e6')

package(){
  cd "$srcdir/$_pkgname"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/$pkgname $pkgdir/opt/$pkgname
  install -Dm755 $srcdir/$pkgname.runtime $pkgdir/usr/bin/photoscanpro
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
