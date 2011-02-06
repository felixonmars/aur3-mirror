# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Maintainer: Zauber Exonar <zauberexonar at gmail>

pkgname=newworldstudio
pkgver=0.6.5.1.B
pkgrel=0
pkgdesc="New World Grids's distribution of OpenSimulator, preconfigured to connect with New World Grid"
arch=('i686' 'x86_64')
url="http://www.newworldgrid.com/"
license=('BSD')
depends=('mono' 'sqlite3' 'mysql')
optdepends=('mono-old')
makedepends=('nant' 'unzip')
install=$pkgname.install
source=(http://srv.lelouya.com/NWG/NewWorldStudio_$pkgver.zip \
  newworldstudio.sh)
md5sums=('e1b5ec1753a1a1cc89f1d8f0bea5a2ba'
         '09e06f0f574c80b7e189211f2be17bef')

build() {
  cd "$srcdir"/RELEASE

  cp $startdir/OpenSim.ini-$pkgver OpenSim.ini || return 1
  cp OpenSim.ini OpenSim.ini.example || return 1

  #copying Mono.Posix.dll so that OpenSimulator can use sockets, and by extension MySQL
  cp /usr/lib/mono/1.0/Mono.Posix.dll Mono.Posix.dll || return 1
  # install
  install -d "$pkgdir"/opt/$pkgname/RELEASE
  cp -r ./* "$pkgdir"/opt/$pkgname/RELEASE/
  # set permissions
  find "$pkgdir"/opt/$pkgname/RELEASE -type d -exec chmod 755 {} +
  find "$pkgdir"/opt/$pkgname/RELEASE -type f -exec chmod 644 {} +
  find "$pkgdir"/opt/$pkgname/RELEASE -name "*.exe" -exec chmod 755 {} +
  find "$pkgdir"/opt/$pkgname/RELEASE -name "*.ini" -exec chmod 666 {} +
  find "$pkgdir"/opt/$pkgname/RELEASE -name "*.xml" -exec chmod 666 {} +
  chmod 777 "$pkgdir"/opt/$pkgname/RELEASE/{,*/}
  chmod 755 "$pkgdir"/opt/$pkgname/RELEASE/opensim-ode.sh
  # chmod 666 "$pkgdir"/opt/$pkgname/RELEASE/OpenSim.log
  # install launch script
  install -m755 -D ../newworldstudio.sh "$pkgdir"/usr/bin/newworldstudio
}
