# Contributor: Andy Roberts (arooaroo) <dev@andy-roberts.net>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=kxdocker-resources
pkgver=1.1.0
pkgrel=5
pkgdesc="Base themes for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
groups=('kxdocker')
depends=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1b1b3c2ff5fd0ddd4426e9011d125dee')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde
  make DESTDIR=${startdir}/pkg install

  # Remove xConfigurator.png to avoid conflict with kxdocker-configurator
  cd ${startdir}/pkg/opt/kde/share/apps/kxdocker/themes/icons
  rm xConfigurator.png

  # Create symlink
  ln -s firefox-bin.png Gecko.png
}
