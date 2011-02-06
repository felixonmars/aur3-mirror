pkgname=x_vsftpd
pkgver=1.2
pkgrel=1
pkgdesc="A GUI to manage vsftpd (Fr)"
arch=('i686' 'x86_64')
url="http://ubunblox.servhome.org/"
license=('GPL')
depends=('dialog')
source=(http://ubunblox.free.fr/UbunBlox/AUR/$pkgname-$pkgver.tar.gz)
md5sums=('428e05d2ff5113065031d738240e8392')
packager=('ubunblox')

build() {
  mkdir -p $startdir/pkg/usr/bin
  install -Dm 755 $srcdir/x_vsftpd $startdir/pkg/usr/bin/
}

