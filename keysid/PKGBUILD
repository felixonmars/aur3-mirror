# Maintainer: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)
pkgname=keysid
pkgver=1.1
pkgrel=2
pkgdesc="Linux keys intercepting daemon"
arch=(i686 x86_64)
url="http://keysid.sourceforge.net/"
license=('GPL2')
groups=()
depends=(sudo)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-$pkgver.tar.gz
        keysid.service)
noextract=()
md5sums=('ff7c82eb34f945f3a7154233b4ee7c11'
         '2a858a0decac5596aec2541790e352be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 keysid.service "$pkgdir/usr/lib/systemd/system/keysid.service"
  cd "$srcdir/$pkgname-$pkgver"
  
  make DESTDIR="${pkgdir}" install
  # move /usr/sbin to /usr/bin
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/keysid/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/keysid/README"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/keysid/ChangeLog"
  install -Dm644 keysid.conf.sample "$pkgdir/etc/keysid/keysid.conf.sample"
}
