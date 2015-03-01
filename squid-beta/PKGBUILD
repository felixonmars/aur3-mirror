# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=squid-beta
pkgver=3.5.2
pkgrel=2
pkgdesc='Full-featured Web proxy cache server'
arch=('x86_64' 'i686')
url='http://www.squid-cache.org'
depends=('openssl' 'pam' 'cron' 'perl' 'libltdl' 'libnetfilter_conntrack' 'libcap' 'nettle' 'libecap')
makedepends=('libcap' 'krb5')
optdepends=('gnutls: for squidclient')
license=('GPL')
conflicts=('squid')
options=('emptydirs')
backup=('etc/squid/squid.conf'
        'etc/squid/mime.conf'
        'etc/squid/errorpage.css'
        'etc/squid/cachemgr.conf'
        'etc/squid/msntauth.conf')
install=squid.install
source=("http://www.squid-cache.org/Versions/v3/3.5/squid-$pkgver.tar.bz2"
        'squid.pam'
        'squid.service'
        'squid.tmpfiles'
        'squid.sysusers'
        'squid-rotate.service'
        'squid-rotate.timer')
md5sums=('b9a14da6e2ab3ea294efeb346486a7fc'
         '270977cdd9b47ef44c0c427ab9034777'
         'ceeb57c69ebb165676219222f109a24e'
         'd243da117c1aee03c0cc6052f023a380'
         '4abff67f9b39db34501025bfdde8794d'
         '5c806290f1c43b53775a9ae31cafb7ce'
         '7f8e79d19d568b359079181ac561645d')
prepare() {
   cd "$srcdir/squid-$pkgver"
}

build() {
  cd "$srcdir/squid-$pkgver"

  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/squid \
    --sysconfdir=/etc/squid \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/squid \
    --localstatedir=/var \
    --with-logdir=/var/log/squid \
    --with-pidfile=/run/squid.pid \
    --with-openssl=/usr \
    --enable-removal-policies="lru,heap" \
    --enable-storeio="aufs,ufs,rock,diskd" \
    --enable-auth \
    --enable-auth-basic \
    --enable-auth-ntlm \
    --enable-auth-digest \
    --enable-auth-negotiate \
    --enable-disk-io \
    --enable-log-daemon-helpers \
    --enable-delay-pools \
    --enable-ssl \
    --enable-eui \
    --enable-esi \
    --enable-async-io \
    --enable-linux-netfilter \
    --enable-ident-lookups \
    --enable-cache-digests \
    --enable-htcp \
    --enable-icmp \
    --enable-epoll \
    --with-large-files \
    --enable-url-rewrite-helpers \
    --with-default-user=proxy \
    --enable-ssl-crtd \
    --enable-zph-qos \
    --with-netfilter-conntrack \
    --disable-arch-native \
    --enable-ecap \
    --enable-follow-x-forwarded-for \
    --disable-scrict-error-checking
  make
}

package() {
  cd "$srcdir"

  make -C "squid-$pkgver" DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/squid.pam" "$pkgdir/etc/pam.d/squid"
  install -Dm644 "$srcdir/squid.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/squid.conf"
  install -Dm644 "$srcdir/squid.sysusers" "$pkgdir/usr/lib/sysusers.d/squid.conf"
  install -Dm644 "$srcdir/squid.service" \
    "$pkgdir/usr/lib/systemd/system/squid.service"
  install -Dm644 "$srcdir/squid-rotate.service" \
    "$pkgdir/usr/lib/systemd/system/squid-rotate.service"
  install -Dm644 "$srcdir/squid-rotate.timer" \
    "$pkgdir/usr/lib/systemd/system/squid-rotate.timer"
  install -dm755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../squid-rotate.timer \
    "$pkgdir/usr/lib/systemd/system/timers.target.wants/squid-rotate.timer"
  rm -rf "$pkgdir/run" "$pkgdir/var/run"
}
