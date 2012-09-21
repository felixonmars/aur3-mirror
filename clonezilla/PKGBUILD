# Mantainer: M0Rf30
pkgname=clonezilla
pkgver=3.1.5
pkgrel=1
pkgdesc="The Free and Open Source Software for Disk Imaging and Cloning"
arch=('i686' 'x86_64')
url="http://clonezilla.org/"
license=('GPL')
depends=('partclone' 'ntfsprogs' 'coreutils' 'partimage' 'drbl' 'pigz' 'sshfs')
source=(http://free.nchc.org.tw/drbl-core/src/experimental/$pkgname-$pkgver.tar.bz2)

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install  
}

md5sums=('e5353ce32be2cbce75a68ecf4cd3649c')
