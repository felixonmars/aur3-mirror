# Maintainer: Affif Mukhlashin <bluemeda@programmer.net>
pkgname=lusca-svn
pkgver=14945
pkgrel=3
pkgdesc="Lusca is a fork of the Squid-2 development tree. The Lusca project aims to fix the shortcomings in the Squid-2 codebase whilst maintaining the the Squid-2 functionality and stability."
arch=('x86_64' 'i686')
url="http://www.lusca.net"
license=('GPL')
depends=('openssl' 'pam' 'cron' 'perl' 'libltdl')
makedepends=('subversion' 'sharutils' 'libcap')
conflicts=('squid')
options=('emptydirs')
backup=('etc/squid/squid.conf'
        'etc/squid/mime.conf')
install=$pkgname.install
source=('svn+http://lusca-cache.googlecode.com/svn/branches/LUSCA_HEAD/'
        'new-gcc.patch'
        'squid.pam'
        'squid.cron'
        'squid.service'
        'keblux-lusca-gzip.patch'
        'ignore-must-revalidate.diff'
        'luscaVaryrR14697.diff'
        '3xx-loop.diff'
        )
md5sums=('SKIP'
         '2438a69dd477f7ccec7b0c14e62bc217'
         '270977cdd9b47ef44c0c427ab9034777'
         'a71425c4951f2e5b640d19e6a5048531'
         '443e2d14d673d2b074e192b2811e90be'
         '19968b8df94b6ca717af45494844ceff'
         'd3be28800389fa2bf6d868162576319f'
         'c5878cf064de77c772ce95573edd90ab'
         '4a0f0e625695c48ba6a9c892d06916ec')

pkgver() {
  cd "LUSCA_HEAD"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "$srcdir/LUSCA_HEAD/"

  patch -p1 -i ../new-gcc.patch
  patch -p0 -i ../luscaVaryrR14697.diff
  patch -p0 -i ../3xx-loop.diff
  patch -p0 -i ../ignore-must-revalidate.diff
  patch -p2 -i ../keblux-lusca-gzip.patch

  # fix cache_dir, cache_dir size, and effective group.
  sed '/^DEFAULT_SWAP_DIR/ s@/cache@/cache/squid@' -i src/Makefile.am
  sed '/^#cache_dir/ s/100/256/
       /^NAME: cache_effective_group/ {n;n;s/none/proxy/}' -i src/cf.data.pre

}

build() {

  cd "$srcdir/LUSCA_HEAD/"
  ./bootstrap.sh

  #
  # BUILD HERE
  #
  ./configure \
  --prefix=/usr \
  --exec_prefix=/usr \
  --bindir=/usr/bin \
  --sbindir=/usr/bin \
  --libexecdir=/usr/lib/squid \
  --sysconfdir=/etc/squid \
  --localstatedir=/var/spool/squid \
  --datadir=/usr/share/squid \
  --enable-http-gzip \
  --enable-async-io=24 \
  --with-aufs-threads=24 \
  --with-pthreads \
  --enable-storeio=aufs \
  --enable-linux-netfilter \
  --enable-arp-acl \
  --enable-epoll \
  --enable-removal-policies=heap \
  --with-aio \
  --with-dl \
  --enable-snmp \
  --enable-delay-pools \
  --enable-htcp \
  --enable-cache-digests \
  --disable-unlinkd \
  --enable-large-cache-files \
  --with-large-files \
  --enable-err-languages=English \
  --enable-default-err-language=English \
  --with-maxfd=65536

  make
}

package() {
  cd "$srcdir/LUSCA_HEAD/"
  make DESTDIR="$pkgdir/" install

  install -Dm755 "$srcdir/squid.cron" "$pkgdir/etc/cron.weekly/squid"
  install -Dm644 "$srcdir/squid.pam" "$pkgdir/etc/pam.d/squid"
  install -Dm644 "$srcdir/squid.service" \
  "$pkgdir/usr/lib/systemd/system/squid.service"
  rm -rf "$pkgdir/run" "$pkgdir/var/run"

}

# vim:set ts=2 sw=2 et:
