# Maintainer: prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Matthias "matthiaskrgr" Krüger
# Contributor: Jookia <166291@gmail.com>

_pkgname=Desurium
pkgname=desurium
pkgver=0.8.0_rc10
pkgrel=2
pkgdesc="A community-driven digital distribution service for gamers (open source version)"
arch=('i686' 'x86_64')
url="http://github.com/desura/Desurium"
license=('GPL3')
depends=('desurium-cef' 'libnotify' 'v8' 'tinyxml' 'boost-libs' 'c-ares' 'xdg-utils' 'xdg-user-dirs' 'desktop-file-utils')
makedepends=('cmake' 'boost' 'python')
provides=('desura')
conflicts=('desura' 'desurium-git')
install=$pkgname.install
source=("https://github.com/desura/Desurium/archive/$pkgver.tar.gz")
md5sums=('f1bde8b11e88787304d91d62b8a1de86')

MULTILIB=0

if [ $CARCH == 'x86_64' ]; then
  MULTILIB=1
  depends+=('gcc-libs-multilib')
fi

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's|downloads/lodle|downloads/desura|' CMakeLists.txt
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  if [ -d build ]; then
    rm -r build
  fi

  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBINDIR=/usr/bin \
        -DRUNTIME_LIBDIR=/usr/lib \
        -DDATADIR=/usr/share \
        -D32BIT_SUPPORT=${MULTILIB} \
        -DBUILD_TESTS=OFF \
        -DBUILD_CEF=OFF \
        -DFORCE_SYS_DEPS=ON \
        -DWITH_FLASH=OFF \
        -DINSTALL_DESKTOP_FILE=ON ..

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir/usr/share/desura/desura.png" "$pkgdir/usr/share/pixmaps/desura.png"
}
