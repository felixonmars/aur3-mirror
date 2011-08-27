# Contributor: Rob Hoelz <hoelz@wisc.edu>

pkgname=hscurses-darcs
pkgver=20061205
pkgrel=1
pkgdesc="Haskell binding for the ncurses library"
arch=(i686 x86_64)
url="http://www.informatik.uni-freiburg.de/~wehr/haskell/"
makedepends=("ghc>=6.6" darcs)
provides=('hscurses')
conflicts=('hscurses')
license=('GPL')
install=('hsmod.install')
source=()
md5sums=()

build() {
  cd $startdir/src
  # I couldn't get it to build with the official release, but this patch
  # works
  darcs get --set-scripts-executable --to-patch="fixed haddock problem" http://www.stefanwehr.de/darcs/hscurses/
  cd hscurses

  runhaskell Setup.hs configure --prefix=/usr || return 1
  runhaskell Setup.hs build || return 1
  runhaskell Setup.hs register --gen-script
  runhaskell Setup.hs unregister --gen-script

  echo > $startdir/hsmod.install
  echo "post_install() {" >> $startdir/hsmod.install

  cat register.sh | sed "s|^#.*||" >> $startdir/hsmod.install
  echo "}" >> $startdir/hsmod.install

  echo "pre_remove() {" >> $startdir/hsmod.install
  cat unregister.sh | sed "s|^#.*||" >> $startdir/hsmod.install
  echo "}" >> $startdir/hsmod.install

  echo -e "\npost_upgrade() {\npost_install\n/bin/true\n}\n" >> $startdir/hsmod.install
  
  echo -e "op=\$1\nshift\n\$op \$*" >> $startdir/hsmod.install

  runhaskell Setup.hs copy --destdir=$startdir/pkg || return 1
  rmdir $startdir/pkg/usr/bin
}

# vim:set ts=2 sw=2 et:
