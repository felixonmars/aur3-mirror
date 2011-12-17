pkgname=btnx-config
pkgver=0.4.9
pkgrel=1
pkgdesc="Button Extension- a GNU/GPL mouse tool for GNU/Linux"
url="https://launchpad.net/btnx-config"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade')
options=('!libtool' '!emptydirs')
source=("http://ftp.de.debian.org/debian/pool/main/b/btnx-config/btnx-config_0.4.9.orig.tar.gz")
md5sums=('b07314c2562a81c7c82cc1561ca387d1')

build() {
  cd "$pkgname-$pkgver"

  init_scripts_path=/etc/rc.d builddocs=no ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" DATAROOTDIR="$pkg" install
}

