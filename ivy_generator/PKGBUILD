# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ivy_generator
pkgver=1.3
pkgrel=3
pkgdesc="Grows ivy in 3d world"
arch=('i686' 'x86_64')
url="http://graphics.uni-konstanz.de/~luft/ivy_generator/"
license=('GPL2')
depends=('libgl' 'qt')
source=(http://graphics.uni-konstanz.de/~luft/$pkgname/package/${pkgname}_Linux_qt4_$pkgver.tar.gz \
        tweak_data_path.diff)
md5sums=('237dba032b927e559a6a7b795d9711c0'
         'afa7978de02c30ea4d67892e4ae90e5a')

build() {
  cd "$srcdir/${pkgname}_linux_qt4_$pkgver/src"

  qmake
  # fix Makefile
  sed -i 's|\(^LIBS.*\)|\1\ -lGL\ -lGLU\ -lQtOpenGL|' Makefile
  # tweak file paths
  patch -Np2 < "$srcdir"/tweak_data_path.diff

  make mocclean || return 1
  make || return 1
  install -D -m755 src "$pkgdir"/usr/bin/ivy
  mkdir -p "$pkgdir"/usr/share/ivy/textures
  install -m644 ../textures/* "$pkgdir"/usr/share/ivy/textures
}

# vim:set ts=2 sw=2 et:
