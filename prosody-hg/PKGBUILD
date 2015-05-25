# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>
# Contributor: Nick Campbell <s0ma AT theangryfist DOT net>
# Contributor: Dwayne Bent <dbb.0@liqd.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=prosody-hg
pkgver=20150524
pkgrel=1
pkgdesc="Development tip of a lightweight and extensible Jabber/XMPP server written in Lua."
arch=('armv7h' 'i686' 'x86_64')
url="http://prosody.im"
license=('MIT')
depends=('lua51' 'lua51-socket' 'lua51-expat' 'lua51-filesystem' 'libidn' 'openssl')
optdepends=('lua51-sec: TLS encryption support'
            'lua51-zlib: compression support')
install=prosody.install
backup=('etc/logrotate.d/prosody'
        'etc/prosody/prosody.cfg.lua')
makedepends=('mercurial')
provides=('prosody')
conflicts=('prosody' 'prosody-devel')
source=('prosody.service'
        'prosody.logrotated'
        'fix-config.patch'
        'prosody.tmpfile.d'
        'prosody::hg+http://hg.prosody.im/trunk')
md5sums=('e74045f27cb60908d535969906781f75'
         '26466fdbea87963a3ca6f48f76fe4a29'
         '3b73bfb8837425ea37cbdd8a2f6eae21'
         'e2f5a1df410b05696a30dcb058841084'
         'SKIP')
_hgrepo="prosody"

pkgver() {
  date +"%Y%m%d"
}

prepare() {
  cd $srcdir/$_hgrepo
  patch -p1 <$srcdir/fix-config.patch
}

build() {
  cd $srcdir/$_hgrepo
  ./configure --ostype=linux --prefix=/usr --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody --with-lua-include=/usr/include/lua5.1 \
    --cflags="${CFLAGS} -fPIC -Wall -Wextra -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" --no-example-certs \
    --runwith=lua5.1
  make
}

package() {
  cd $srcdir/$_hgrepo

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C tools/migration

  install -Dm 0644 $srcdir/prosody.logrotated "${pkgdir}"/etc/logrotate.d/prosody
  install -Dm 0644 $srcdir/prosody.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/prosody.conf
  install -Dm 0644 $srcdir/prosody.service "${pkgdir}"/usr/lib/systemd/system/prosody.service

  for i in tools/*.lua; do
    install -Dm 0644 ${i} "${pkgdir}"/usr/share/prosody/${i}
  done

  install -Dm 0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  rm "${pkgdir}"/etc/prosody/certs/*
}

# vim:set ts=2 sw=2 et:
