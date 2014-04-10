# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=dnscrypt-proxy-git
pkgver=1.3.3.r118.gb4f532b
pkgrel=1
pkgdesc="A tool for securing communications between a client and a DNS resolver"
arch=('i686' 'x86_64')
url="http://dnscrypt.org/"
license=('custom:ISC')
depends=('libsodium')
makedepends=('git')
provides=('dnscrypt-proxy')
conflicts=('dnscrypt-proxy')
backup=('etc/conf.d/dnscrypt-proxy')
source=('git://github.com/jedisct1/dnscrypt-proxy.git'
        'conf.d.file'
        'dnscrypt-proxy.service')
sha1sums=('SKIP'
          '3f5cb8efc0a1d88b4d70b5167406e2f60e611d03'
          'bf69ce98f7ea50efe5898653d3206a1b9dc08394')

pkgver() {
  cd "$srcdir"/dnscrypt-proxy
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/dnscrypt-proxy
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir"/dnscrypt-proxy
  make DESTDIR="$pkgdir" install

  install -d -m 755 "$pkgdir"/{usr/share/{licenses,doc}/$pkgname,etc/conf.d,usr/lib/systemd/system}
  install -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 AUTHORS NEWS README.markdown "$pkgdir/usr/share/doc/$pkgname"
  install -m 644 "$srcdir"/conf.d.file "$pkgdir"/etc/conf.d/dnscrypt-proxy
  install -m 644 "$srcdir"/dnscrypt-proxy.service "$pkgdir"/usr/lib/systemd/system
}
