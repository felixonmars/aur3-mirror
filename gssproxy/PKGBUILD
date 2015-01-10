# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=gssproxy
pkgver=0.3.1
pkgrel=1
pkgdesc="GSSAPI Proxy"
arch=(i686 x86_64)
url="https://fedorahosted.org/gss-proxy/"
license=(MIT)
depends=(
  'keyutils'
  'krb5'
  'popt'
  'libxml2'
  'libxslt'

  # krb5 includes verto, but not its pkg-config file.
  # Currently, VERTO_LIBS is specified as workaround.
  # (Alternatively, build krb5 using --with-system-verto.)
  #'libverto'

  # At least one ini library is required:
  # - if ding-libs (ini_config.pc) is present, it will be used;
  # - otherwise, iniparser will be used.
  'ding-libs' # community
  'iniparser' # extra
)
makedepends=(
  'docbook-xsl'
  'doxygen'
)
source=("https://fedorahosted.org/released/gss-proxy/gssproxy-$pkgver.tar.gz"
        "https://fedorahosted.org/gss-proxy/raw-attachment/ticket/131/0001-Fix-error-in-compiling-without-SELinux.patch"
        "gssproxy.conf"
        "gssproxy.service")
sha1sums=('766ccc697e4f3fda0eed050f952afbcbf80fa440'
          'f08726a80d29c12b940e1c5c27eef2d19db93065'
          'SKIP'
          'SKIP')
backup=('etc/gssproxy/gssproxy.conf')

prepare() {
  cd "$srcdir/gssproxy-$pkgver"
  patch -Np2 < "../0001-Fix-error-in-compiling-without-SELinux.patch"
}

build() {
  cd "$srcdir/gssproxy-$pkgver"
  # make it work with bundled verto from krb5
  export VERTO_CFLAGS="-I/usr/include"
  export VERTO_LIBS="-L/usr/lib -lverto"
  ./configure \
    --prefix=/usr             \
    --sysconfdir=/etc         \
    --sbindir=/usr/bin        \
    --localstatedir=/var      \
    --without-selinux         \
    --with-initscript=systemd ;
  make
}

package() {
  cd "$srcdir/gssproxy-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf \
    "$pkgdir/etc/gss"       \
    "$pkgdir/usr/include"   \
    "$pkgdir/usr/share/doc" ;

  install -Dm0644 "../gssproxy.conf" "$pkgdir/etc/gssproxy/gssproxy.conf"
  #install -Dm0644 "../gssproxy.service" "$pkgdir/usr/lib/systemd/system/gssproxy.service"
}


# vim: ts=2:sw=2:et
