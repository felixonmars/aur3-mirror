# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=bin32-ltrace
_pkgname=ltrace
pkgver=0.6.0
pkgrel=1
pkgdesc="Tracks runtime library calls in dynamically linked programs -- 32-bit version"
arch=('x86_64')
url="http://ltrace.org/"
license=('GPL')
depends=('lib32-elfutils')
makedepends=('gcc-multilib')
source=("http://dev.archlinux.org/~foutrelis/sources/ltrace/$_pkgname-$pkgver.tar.xz"
        "fix-crash-on-int3-after-symcall.patch")
md5sums=('042592865eb55efb56cb7a10207ca94d'
         'd40f323b1334e823476806704c4ee344')
sha256sums=('13e4a66aa1f2ad23fd4ddd7faa79c52a68f210155eeb6490ce421f2a07fa0706'
            '166ff5ff2341b46a66d24d033acfa77153238257ca9a51cdec20ab2cc9753c6c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Fix FS#27250: SIGSEGV due to int3 right after a call instruction
  patch -Np1 -i "$srcdir/fix-crash-on-int3-after-symcall.patch"

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --program-suffix=32 --host=i686-pc-linux-gnu
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Remove what is common with extra/ltrace
  rm -rf "$pkgdir/etc" "$pkgdir/usr/share/doc"
}
