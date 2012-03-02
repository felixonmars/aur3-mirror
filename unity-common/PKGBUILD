# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=unity-common
_pkgname=unity
pkgver=5.0.0
pkgrel=2
pkgdesc="Shared files between unity and unity-2d"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity"
license=('GPL' 'LGPL')
depends=('nux' 'dee' 'libindicator3' 'dconf')
makedepends=('cmake' 'boost' 'libunity' 'gconf')
install=$pkgname.install
source=(http://launchpad.net/$_pkgname/5.0/$pkgver/+download/$_pkgname-$pkgver.tar.bz2
        nautilus-home.desktop
        make-optional.patch
        use-unity-profile.patch
        default-settings.patch)
md5sums=('e41f5991ca0cdaac73f5c807a671b374'
         '236c7d9173d65adc704b953d77724739'
         '11c9e0c3a0f9cc7b0e532866bb2525cb'
         'cd19df00c59f647b1ae8b9d8cfd94c24'
         'ef670e1f847b0e0090751dbc6b949d06')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' tools/*

  # Make some components optional
  patch -Np1 -i "$srcdir/make-optional.patch"

  # Use unity profile
  patch -Np1 -i "$srcdir/use-unity-profile.patch"

  # Set some default settings
  patch -Np1 -i "$srcdir/default-settings.patch"

  # Fix build
  echo "$pkgver" > VERSION

  [[ -d build ]] || mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DBUILD_I18N=OFF \
           -DBUILD_COMPIZ=OFF \
           -DBUILD_TESTS=OFF
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  # Install Home folder for launcher
  install -Dm644 "$srcdir/nautilus-home.desktop" "$pkgdir/usr/share/applications/nautilus-home.desktop"
}
