# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Pavel Panchekha <pavpanchekha@gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=mit-zephyr
pkgver=3.1.2
pkgrel=1
pkgdesc="An enterprise-scale, distributed real-time messaging and notification system, configured for use with MIT's network"
arch=('i686' 'x86_64')
url="http://zephyr.1ts.org/"
license=('MIT')
depends=('e2fsprogs' 'libx11' 'krb5' 'hesiod')
options=('!libtool')
source=("https://github.com/zephyr-im/zephyr/archive/release/$pkgver.tar.gz" "zhm.service" "krb5.conf.mit")
md5sums=('858a6c01a8bcb9aec92eaf163f06d266' 'b468f886cb2a8d56d224d4cd0bff4e09' '788786a77527aa7c50ee2c139b00523a')
conflicts=('zephyr')
provides=('zephyr')
install=mit-zephyr.install

build() {
  cd "$srcdir/zephyr-release-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --with-hesiod --with-krb5 --disable-static
  make
}

package() {
  # zhm systemd service
  install -Dm644 "$srcdir"/zhm.service "$pkgdir"/usr/lib/systemd/user/zhm.service
  
  # kerberos configuration for MIT
  install -Dm644 "$srcdir"/krb5.conf.mit "$pkgdir"/usr/share/$pkgname/krb5.conf.mit
  
  # install zephyr
  cd "$srcdir/zephyr-release-$pkgver"
  make DESTDIR="$pkgdir" install
}
