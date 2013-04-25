# Maintainer: Zom <zom[at]eevul[dot]org>

pkgname=beshell-git
_gitname=be-shell
pkgver=2013.04.25
pkgrel=1
pkgdesc="Simple desktop shell using KDE technology (solid and kio)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/be-shell/"
license=('GPL')
depends=('kdelibs')
makedepends=('git' 'automoc4' 'cmake')
optdepends=('kdebase-runtime')
install='beshell.install'
source=("$_gitname::git://git.code.sf.net/p/be-shell/code")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  install -d ${pkgdir}/usr/share/beshell

  cp -r ../examples/ ${pkgdir}/usr/share/beshell
  cp -r ../scripts/ ${pkgdir}/usr/share/beshell
  install -m0644 ../be.idle.imap/be.idle.imap.conf ${pkgdir}/usr/share/beshell/examples/
  install -m0644 ../krunner.desktop ${pkgdir}/usr/share/beshell/examples/
  install -m0644 ../plasma-desktop.desktop ${pkgdir}/usr/share/beshell/examples/
}
