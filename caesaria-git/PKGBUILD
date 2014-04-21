# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=caesaria-git
_pkgname=caesaria
pkgver=1425.7d3dff4
pkgrel=1
pkgdesc='Open Source implementation of Caesar III'
arch=('i686' 'x86_64')
url='https://bitbucket.org/dalerank/caesaria'
license=('GPL3' 'BSD2')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image')
makedepends=('cmake')
conflicts=('caesaria-bin' 'opencaesar3-git')
install=$_pkgname.install
source=('git+https://bitbucket.org/dalerank/caesaria.git'
        "$_pkgname.sh")
sha512sums=('SKIP'
            '4add3f305b174221604a1ed34a1277ab8689a8ca1f4a798523b5e3909c1abb0372f4a3c931e6bb58c6ca8f47f111e6bb280508017000391b9004248b0c2073ef')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  cmake ./
  make
}

package() {
  cd "$srcdir/$_pkgname-test"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -r resources "$pkgdir/opt/$_pkgname"

  install -m755 "$_pkgname.linux" "$pkgdir/opt/$_pkgname"


  cd "$srcdir/$_pkgname"
  
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 INSTALL_LINUX INSTALL_WINDOWS README.md "$pkgdir/usr/share/doc/$_pkgname"

  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 LICENSE LICENSE_GPL3 "$pkgdir/usr/share/licenses/$_pkgname"


  install -D -m755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
