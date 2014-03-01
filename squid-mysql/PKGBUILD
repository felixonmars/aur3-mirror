# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=squid-mysql
pkgver=3.4.3
pkgrel=1
pkgdesc='Full-featured Web proxy cache server with MySQL authentication support compiled'
arch=('x86_64' 'i686')
url='http://www.squid-cache.org'
depends=('openssl' 'pam' 'cron' 'perl' 'libltdl')
makedepends=('libcap' 'krb5')
license=('GPL')
options=('emptydirs')
conflicts=('squid')
backup=('etc/squid/squid.conf'
        'etc/squid/mime.conf')
install=$pkgname.install
source=("http://www.squid-cache.org/Versions/v3/3.4/squid-$pkgver.tar.bz2"
        'squid.pam'
        'squid.cron'
        'squid.service'
        'squid.tmpfiles')
md5sums=('4c4c53d2260afd6e7e2dd7c445c92920'
         '270977cdd9b47ef44c0c427ab9034777'
         '15dca9a76322681b3b56009559744606'
         'ceeb57c69ebb165676219222f109a24e'
         'd243da117c1aee03c0cc6052f023a380')

build() {
  cd "$srcdir/squid-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --datadir=/usr/share/squid \
    --sysconfdir=/etc/squid \
    --libexecdir=/usr/lib/squid \
    --localstatedir=/var \
    --with-logdir=/var/log/squid \
    --with-pidfile=/run/squid.pid \
    --enable-auth \
    --enable-auth-basic \
    --enable-auth-ntlm \
    --enable-auth-digest \
    --enable-auth-negotiate \
    --enable-basic-auth-helpers=DB \
    --enable-removal-policies="lru,heap" \
    --enable-storeio="aufs,ufs,diskd" \
    --enable-delay-pools \
    --enable-arp-acl \
    --enable-ssl \
    --enable-snmp \
    --enable-linux-netfilter \
    --enable-ident-lookups \
    --enable-useragent-log \
    --enable-cache-digests \
    --enable-referer-log \
    --enable-arp-acl \
    --enable-htcp \
    --enable-carp \
    --enable-epoll \
    --with-large-files \
    --enable-arp-acl \
    --with-default-user=proxy \
    --enable-async-io \
    --enable-truncate \
    --enable-icap-client \
    --enable-ssl-crtd \
    --disable-arch-native \
    --disable-strict-error-checking
  make
}

package() {
  cd "$srcdir"

  make -C "squid-$pkgver" DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/squid.cron" "$pkgdir/etc/cron.weekly/squid"
  install -Dm644 "$srcdir/squid.pam" "$pkgdir/etc/pam.d/squid"
  install -Dm644 "$srcdir/squid.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/squid.conf"
  install -Dm644 "$srcdir/squid.service" \
    "$pkgdir/usr/lib/systemd/system/squid.service"
  rm -rf "$pkgdir/run" "$pkgdir/var/run"
}

# vim: ts=2 sw=2 et ft=sh


