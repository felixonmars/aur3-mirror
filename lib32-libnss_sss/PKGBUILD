# Maintainer: John Koelndorfer <jkoelndorfer@gmail.com>
pkgname=lib32-libnss_sss
_pkgname='sssd'
pkgver=1.11.6
_pkgver=$pkgver
pkgrel=1
pkgdesc="32-bit libnss_sss"
arch=('x86_64')
url="https://fedorahosted.org/sssd"
license=('GPL3')
depends=('sssd' 'lib32-glibc')
makedepends=(
  'gcc-multilib'

  # Below packages copied from sssd
  'docbook-xsl'
  'doxygen'
  'python2'
  'samba'
)
source=("https://fedorahosted.org/released/$_pkgname/$_pkgname-$_pkgver.tar.gz"
        "https://fedorahosted.org/released/$_pkgname/$_pkgname-$_pkgver.tar.gz.asc")
sha1sums=('ce1d38f89a567178e0b6a41b6bb70b11d290d4ac'
          'ca8ce9fd9ee8980692f42ef7f7c8910230262fb3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export PYTHON='/usr/bin/python2'
  ./configure \
    --prefix=/usr                                 \
    --sbindir=/usr/bin                            \
    --sysconfdir=/etc                             \
    --localstatedir=/var                          \
    --libexecdir=/usr/lib/sssd                    \
    --datadir=/usr/share                          \
    --enable-pammoddir=/usr/lib/security          \
    --with-initscript=systemd                     \
    --with-os=fedora                              \
    --with-pid-path=/run                          \
    --with-python-bindings                        \
    --without-selinux                             \
    --without-semanage                            \
    --with-systemdunitdir=/usr/lib/systemd/system \
    ;
  make CC='gcc -m32' libnss_sss.la
}

package() {
  mkdir -p "$pkgdir/usr/lib32"
  cd "$srcdir/$_pkgname-$pkgver"
  cp -a .libs/libnss_sss.so* "$pkgdir/usr/lib32"
}

# vim: ts=2:sw=2:et
