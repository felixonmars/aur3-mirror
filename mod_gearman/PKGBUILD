pkgname='mod_gearman'
pkgver='1.4.6'
pkgrel='1'
pkgdesc='Mod_Gearman is an easy way of distributing active Nagios checks across your network.'
arch=('i686' 'x86_64')
url="http://mod-gearman.org"
license='GPL3'
makedepends=()
optdepends=()
depends=('gearman' 'automake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://mod-gearman.org/download/v$pkgver/src/mod_gearman-$pkgver.tar.gz" "autogen.sh" "mod-gearman-worker.service")
md5sums=('b28c52f0c99fcbb99baceb4ed5965910'
         '397c40698313ef4bc5e13da9ec233d2b'
         '1d4eae2ab5f042c1912fce158aac4568')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ../../autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-config
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp ../../mod-gearman-worker.service $pkgdir/usr/lib/systemd/system
}

