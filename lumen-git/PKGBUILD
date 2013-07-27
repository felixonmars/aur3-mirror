# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=lumen-git
pkgver=20130727
pkgrel=1
pkgdesc="user interface library for Ada designed to support visually oriented applications"
arch=('i686' 'x86_64')
url="http://www.niestu.com/software/lumen/"
license=('GPL')
depends=('gcc-ada')
makedepends=('git')
provides=('lumen')
source=(lumen.gpr opengl.gpr)
md5sums=('d0685cf76466ad89a025c4ec983a4e21'
         '553350230e39cc552463f19b1ac849f1')

_gitroot=https://github.com/karakalo/lumen.git
_gitname=lumen

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  gnatmake -P lumen
}

package() {
  cd "$srcdir/$_gitname-build"

  msg "Installing library..."

  install -d -o root -g root -m 755 "${pkgdir}"/usr/lib/lumen
  install -o root -g root -m 644 -t "${pkgdir}"/usr/lib/lumen lib/*.ali
  install -o root -g root -m 644 -t "${pkgdir}"/usr/lib lib/*.a
  #install -o root -g root -m 644 -t "${pkgdir}"/usr/lib lib/*.so

  install -d -o root -g root -m 755 "${pkgdir}"/usr/include/lumen
  install -d -o root -g root -m 755 "${pkgdir}"/usr/include/lumen/gl
  install -o root -g root -m 644 -t "${pkgdir}"/usr/include/lumen src/*.ad[bs]
  install -o root -g root -m 644 -t "${pkgdir}"/usr/include/lumen/gl gl/*.ad[bs]

  install -d -o root -g root -m 755 "${pkgdir}"/usr/lib/gnat
  install -o root -g root -m 644 "$srcdir"/lumen.gpr "${pkgdir}"/usr/lib/gnat
  install -o root -g root -m 644 "$srcdir"/opengl.gpr "${pkgdir}"/usr/lib/gnat
}
