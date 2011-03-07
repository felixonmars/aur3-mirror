# Contributor: Greg von Nessi <greg.vonnessi@gmail.com>

pkgname=gruler
pkgver=0.8
pkgrel=2
pkgdesc="A GNOME screen ruler with many features including vertical and horizontal orientation."
arch=('i686' 'x86_64')
url="http://gnomecoder.wordpress.com/screenruler/"
license=('GPL')
depends=('ruby-gtk2' 'ruby-libglade' 'ruby-cairo' 'ruby-gconf2')
makedepends=('intltool')
source=(http://info.openanswers.org/downloads/$pkgname-latest.tar.gz \
	arch_fix.patch \
	gruler_bash_wrapper \
        $pkgname.desktop)

md5sums=('3dd73d2a82559e4281be5eabbdb2fbbd' 
	 'd4522553a6642688096811cebb55154a'
	 '7df20dd983bb33891bcadb784cde1dc9'
	 '1a7f53ba67ec802ba5f1d2bb599f512c')

build() {

  cd $startdir/src/$pkgname/

  # without this, gruler will not start
  patch -Np1 -i ../arch_fix.patch || return 1

  # no compile for installation
  mkdir -p $startdir/pkg/usr/share/{$pkgname,applications,pixmaps,$pkgname/utils}
  install -m644 $startdir/src/$pkgname/{gruler*.[a-p]*,[p-r]*.rb} \
	  $startdir/pkg/usr/share/$pkgname/
  install -m755 $startdir/src/$pkgname/gruler.rb \
	  $startdir/pkg/usr/share/$pkgname/
  install -m644 $startdir/src/$pkgname/utils/*.rb \
	  $startdir/pkg/usr/share/$pkgname/utils/ 

  # creation of menu entrie 
  install -m644 $startdir/src/$pkgname.desktop \
          $startdir/pkg/usr/share/applications/
  install -m644 $startdir/src/$pkgname/$pkgname-icon.png \
           $startdir/pkg/usr/share/pixmaps/

  # install the bash wrapper, gruler can't be separated from the util
  # subdirectory and ammending the PATH is too intrusive for such a small
  # program. A wrapper seemed to be the most elegant solution.
  mkdir -p $startdir/pkg/usr/bin
  install -m755 $startdir/src/gruler_bash_wrapper $startdir/pkg/usr/bin/gruler
}
