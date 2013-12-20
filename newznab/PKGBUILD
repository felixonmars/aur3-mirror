# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=newznab
pkgver=0.2.3
pkgrel=2
pkgdesc="Usenet indexer"
arch=('any')
url="http://www.newznab.com"
license=('GPL')
depends=('php' 'php-apache' 'php-pear' 'php-gd' 'apache' 'mariadb')
optdepends=('unrar: Deep RAR inspection'
  'ffmpeg: Thumbnailing if deep RAR inspection is enabled'
  'mediainfo: Media info if deep RAR inspection is enabled')
backup=("etc/httpd/conf/extra/$pkgname.conf")
source=("http://www.newznab.com/$pkgname-$pkgver.zip" "$pkgname.conf")
sha256sums=('234c3421a1ad1c03697db980976c2c11b843b4551f442960e331481cca917d73'
            '06b7621966ce1cfd60e94253e2f279613e0d188557e985d766cf4c69080da008')

package() {
  cd $srcdir/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/share/webapps/$pkgname
  cp -rv ./* $pkgdir/usr/share/webapps/$pkgname
  chown -R http:http $pkgdir/usr/share/webapps/$pkgname/*
  mkdir -p $pkgdir/etc/httpd/conf/extra
  install -m 644 $srcdir/$pkgname.conf  $pkgdir/etc/httpd/conf/extra/
}

# vim:set ts=2 sw=2 et:
