# Maintainer: FaziBear <fazibear@gmail.com>
pkgname=ruby-qt4
pkgver=1.4.10
pkgrel=2
pkgdesc="Ruby bindings for the Qt4 toolkit."
url="http://rubyforge.org/projects/korundum/"
depends=('ruby' 'qt' )
makedepend=('cmake')
source=("http://rubyforge.rubyuser.de/korundum/qt4-qtruby-$pkgver.tgz" 'qt.patch' 'cmakelists.patch')
md5sums=('3bbc8f869ad50123e61e493795dab38a' '7953715ff81e94a6ea94314d9dfeef5d' '9e62e475e80cdefc683675cc27427da6')
conflicts=('kdebindings')
arch=('i686' 'x86_64')
license=('GPL')
build() {
  cd $startdir 
  patch -p0 < qt.patch
  patch -p0 < cmakelists.patch

  cd $startdir/src/qt4-qtruby-$pkgver/
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  
  make || return 1
  make DESTDIR=$startdir/pkg install

  # Remove the .la files
  find $startdir/pkg -name '*.la' -exec rm -f {} \;
}
