# Maintainer: Julie Iaccarino <reiv3r@gmail.com>

pkgname=ecore-latest
_pkgname=ecore
pkgver=1.7.6
pkgrel=1
pkgdesc='E17 Core mainloop, display abstraction and utility library.'
url='http://enlightenment.org/'
license=('LGPL2.1')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('glibc')
depends=('eina' 'evas' 'glib2' 'libxp' 'curl' 'libxss' 'libxtst'
  'libxcomposite' 'libxrandr' 'libxinerama' 'libxcursor')
provides=('ecore=1.7.6')
conflicts=('ecore')
source=("http://download.enlightenment.org/releases/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a41828b5b4ca42283d8658c0fe54db07')

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CFLAGS}"
  export CXXFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections ${CXXFLAGS}"
  export LDFLAGS="-fvisibility=hidden -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--as-needed  ${LDFLAGS}"

        ./configure \
--prefix=/usr \
    --libexecdir=/usr/lib/ecore \
    --with-internal-maximum-log-level=3 \
    --disable-static \
    --disable-ecore-timer-dump \
    --enable-glib \
    --enable-ecore-x-composite \
    --enable-ecore-x-damage \
    --enable-ecore-x-dpms \
    --enable-ecore-x-randr \
    --enable-ecore-x-render \
    --enable-ecore-x-screensaver \
    --enable-ecore-x-shape \
    --enable-ecore-x-gesture \
    --enable-ecore-x-sync \
    --enable-ecore-x-xfixes \
    --enable-ecore-x-xinerama \
    --enable-ecore-x-xprint \
    --enable-ecore-x-xtest \
    --enable-ecore-x-cursor \
    --enable-ecore-x-input \
    --enable-ecore-x-dri \
    --enable-epoll \
    --enable-posix-threads \
    --disable-debug-threads \
    --enable-thread-safety \
    --enable-atfile-source \
    --enable-ecore-con \
    --enable-curl \
    --disable-gnutls \
    --enable-openssl \
    --enable-ecore-ipc \
    --enable-ecore-file \
    --enable-poll \
    --enable-inotify \
    --enable-ecore-imf \
    --enable-ecore-imf-evas \
    --enable-ecore-input \
    --enable-ecore-input-evas \
    --enable-ecore-imf-xim \
    --disable-ecore-imf-scim \
    --disable-ecore-imf-ibus \
    --enable-ecore-x \
    --disable-ecore-sdl \
    --enable-ecore-fb \
    --disable-ecore-directfb \
    --enable-ecore-evas \
    --enable-ecore-evas-software-buffer \
    --enable-ecore-evas-software-x11 \
    --enable-ecore-evas-opengl-x11 \
    --enable-ecore-evas-fb \
    --disable-ecore-evas-ews \
    --disable-ecore-wayland \
    --disable-tests \
    --disable-coverage \
    --disable-install-examples \
    --disable-doc

        make
}

package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install

# install license files
  install -Dm644 $srcdir/$_pkgname-$pkgver/COPYING \
        $pkgdir/usr/share/licenses/$_pkgname/COPYING
}


