# Maintainer: sh0 <mee@sh0.org>

_pkgname=iptraf
pkgname=iptraf-ipv6
pkgver=3.0.1
pkgrel=3
pkgdesc="An IP network monitor (with IPv6 support)"
url="http://iptraf.seul.org"
arch=('i686' 'x86_64')
depends=('ncurses')
license=('GPL')
conflicts=('iptraf')
replaces=('iptraf')
source=("ftp://iptraf.seul.org/pub/iptraf/$_pkgname-$pkgver.tar.gz"
        'add-devnames.patch'
        'ncursesw.patch'
        'setlocale.patch'
        'vlan.patch'
        'ipv6.patch'
        'ipv6-glibc24-updated.patch'
        'if_tr.c-header-fix.patch')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  patch -Np1 -i "$srcdir"/if_tr.c-header-fix.patch
  patch -Np1 -i "$srcdir"/add-devnames.patch
  patch -Np1 -i "$srcdir"/ncursesw.patch
  patch -Np1 -i "$srcdir"/setlocale.patch
  patch -Np0 -i "$srcdir"/vlan.patch
  patch -Np2 -i "$srcdir"/ipv6.patch
  patch -Np0 -i "$srcdir"/ipv6-glibc24-updated.patch

  cd src/
  sed -e 's|/var/local/iptraf|/var/lib/iptraf|' \
      -e 's|/usr/local/bin|/usr/sbin|'\
      -i dirs.h

  make \
    CFLAGS="$CFLAGS" \
    DEBUG="" \
    TARGET="/usr/sbin" \
    WORKDIR="/var/lib/iptraf" \
    clean all
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver/src

  for sbin in iptraf rvnamed; do
    install -D -m755 $sbin "$pkgdir"/usr/sbin/$sbin
  done

  cd "$srcdir"/$_pkgname-$pkgver/Documentation
  for man in *.8; do
    install -D -m644 $man "$pkgdir"/usr/share/man/man8/$man
  done

  mkdir -p "$pkgdir"/var/{lib,log,run}/iptraf
}
md5sums=('004c2c005a1b78739e22bc49d33e244d'
         '382b79be844d959dea3c4362b7a62576'
         'e9cc01e018a1e0da2f30fa5640c365f9'
         'e10867d75a7ac82ce32104c1ebe92bec'
         '4136483b9e41c8789c629c42f9a67d07'
         '122a9683655df02ee2cd13f2d2c66eea'
         '6036d6df83d65920bd81fb0fd8c70662'
         '16ecda134c80c1295349e7a6c25e082c')
