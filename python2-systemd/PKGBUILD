# Maintainer: Steven Hiscocks <steven@hiscocks.me.uk>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname='python2-systemd'
pkgdesc='python2 bindings for systemd'
pkgver=204
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
depends=('systemd' 'python2>=2.7')
makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'quota-tools' 'xz')
options=('!libtool')
source=("http://www.freedesktop.org/software/systemd/systemd-$pkgver.tar.xz"
        'use-split-usr-path.patch')
md5sums=('a07619bb19f48164fbf0761d12fd39a8'
         '76bf83fe34c5b40533abc5dc940576a6')

prepare() {
  cd "systemd-$pkgver"

  # hang onto this until we do the /{,s}bin merge
  patch -Np1 <"$srcdir/use-split-usr-path.patch"
}

build() {
  cd "systemd-$pkgver"

  ./configure \
      PYTHON=python2 \
      PYTHON_CONFIG=python2-config \
      --enable-static \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-audit \
      --disable-ima \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --with-firmware-path="/usr/lib/firmware/updates:/usr/lib/firmware"

  make
}

package() {
    
  make -C "systemd-$pkgver" DESTDIR="$pkgdir/_systemd" install

  mkdir -p "$pkgdir/usr/lib"

  cp -r "$pkgdir/_systemd/usr/lib/python2.7" "$pkgdir/usr/lib/"

  rm -r "$pkgdir/_systemd"
}

# vim: ft=sh syn=sh et
