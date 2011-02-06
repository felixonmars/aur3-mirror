# Maintainer: Filip Lasak <flasak@gmail.com>
# karchiver 64bit pkg : http://193.19.145.30/arch

pkgname=karchiver
pkgver=3.4.2.b4
pkgrel=1
pkgdesc="KDE archiver that supports tar.gz, tar.bz2, zip, rar archives just with your mouse"
url="http://perso.orange.fr/coquelle/karchiver"
depends=('kdebase' 'unzip' 'bzip2' 'gzip' 'tar' 'unrar')
source=(http://perso.wanadoo.fr/coquelle/karchiver/$pkgname-$pkgver.tar.bz2)
md5sums=('43022f2d58dfeef1aed13b48c3f08869')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
