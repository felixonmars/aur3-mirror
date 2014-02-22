# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Maintainer: Alex Puterbaugh <puterbaugh.0@gmail.com>

pkgname=imlibsetroot
pkgver=1.6
pkgrel=1
pkgdesc="A root background (wallpaper) setter with support for image scaling and xinerama."
arch=('x86_64' 'i686')
url="http://robotmonkeys.net/2012/12/30/imlibsetroot-1-6/"
license=('GPL')
depends=('xproto' 'libx11' 'imlib2' 'libxinerama')
source=("http://robotmonkeys.net/wp-content/uploads/2012/12/imlibsetroot-16.tar.gz"
        "build.patch")
sha1sums=('ed362d7c4eac4da0b9d2f32519dc7fe7b3a9cf83'
          '3c0319b76ad4b4f7777cfba761d09804e7a2e4b9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/build.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 -T ./imlibsetroot ${pkgdir}/usr/bin/imlibsetroot
  install -D -m755 -T ./gnome_imlibsetroot ${pkgdir}/usr/bin/gnome_imlibsetroot
}

# vim:set ts=2 sw=2 et:
