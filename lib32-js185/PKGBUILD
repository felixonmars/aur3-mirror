# Maintainer: jtts
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=js185
pkgname=lib32-$_pkgbasename
pkgver=1.0.0
pkgrel=2
pkgdesc="JavaScript interpreter and libraries (legacy) (32-bit)"
arch=(x86_64)
url="https://developer.mozilla.org/En/SpiderMonkey/1.8.5"
license=(MPL)
depends=(lib32-nspr gcc-libs-multilib lib32-libstdc++5 js185)
makedepends=(gcc-multilib python2 zip)
options=(!staticlibs)
source=(http://ftp.mozilla.org/pub/mozilla.org/js/$_pkgbasename-$pkgver.tar.gz)
# Not anymore in 'extra/js185' -package (no longer needed?)
#        js185-destdir.patch)
sha256sums=('5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  # The configure-script tries to look these as i686-pc-linux-gnu-$TOOLNAME
  # and fails miserably. Define the variables here.
  export RANLIB=ranlib
  export AR=ar
  export AS=as
  export LD=ld
  export STRIP=strip

  cd js-1.8.5/js/src

  # Not anymore in 'extra/js185' -package (no longer needed?)
  #patch -Np0 -i $srcdir/js185-destdir.patch

  # _FORTIFY_SOURCE causes configure error
  unset CPPFLAGS

  # These configure options do not work, since Arclinux doesn't have
  # a 32-bit nspr-config. We have to pass nspr-cflags and nspr-libs 
  # variables manually to the configure script.
  # --with-system-nspr 
  # --with-nspr-exec-prefix=/usr/lib32 
  # --with-nspr-prefix=/usr/lib32 
  ./configure --prefix=/usr \
      --target=i686-pc-linux-gnu \
      --libdir=/usr/lib32 \
      --with-nspr-cflags="-I/usr/include/nspr" \
      --with-nspr-libs="-L/usr/lib32 -lplds4 -lplc4 -lnspr4 -lpthread -ldl" \
      --enable-threadsafe
  make
}

package() {
  cd js-1.8.5/js/src
  make DESTDIR="$pkgdir" install
  # Not needed. This is a lib32-package.
  #install -Dm755 shell/js "$pkgdir/usr/bin/js"
  find "$pkgdir"/usr/{lib32/pkgconfig,include} -type f -exec chmod -x {} +

  # Bad symlinks (absolute, including DESTDIR!)
  cd "$pkgdir/usr/lib32"
  ln -sf libmozjs185.so.1.0.0 libmozjs185.so.1.0
  ln -sf libmozjs185.so.1.0 libmozjs185.so

  # cleanup for lib32 package
  rm -rf "${pkgdir}"/{etc,sbin,usr/bin,usr/{include,share}}
}

# vim:set ts=2 sw=2 et:
