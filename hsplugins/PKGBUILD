pkgname=hsplugins
pkgver=1.0_rc0
_pkgver=1.0-rc0
pkgrel=1
pkgdesc="Plugins support for the Haskell programming language."
arch=(i686 x86_64)
url="http://www.cse.unsw.edu.au/~dons/hs-plugins/"
makedepends=(ghc automake autoconf)
source=($url/hs-plugins-$_pkgver.tar.gz)
install=('hsmod.install')
md5sums=('1e70cb9db881a2ba913c8219e18aa406')
license=('GPL')

build() {
  cd $startdir/src/hs-plugins

  sed -i -e '/^TOP=/ c\
  TOP=`pwd`' configure.ac
  aclocal
  autoconf
  chmod +x configure

  runhaskell Setup.lhs configure --prefix=/usr || return 1
  runhaskell Setup.lhs build || return 1
  runhaskell Setup.lhs register --gen-script
  runhaskell Setup.lhs unregister --gen-script

  echo > $startdir/hsmod.install
  echo "post_install() {" >> $startdir/hsmod.install

  cat register.sh | sed "s|^#.*||" >> $startdir/hsmod.install
  echo "}" >> $startdir/hsmod.install

  echo "pre_remove() {" >> $startdir/hsmod.install
  cat unregister.sh | sed "s|^#.*||" >> $startdir/hsmod.install
  echo "}" >> $startdir/hsmod.install

  echo -e "\npost_upgrade() {\npost_install\n/bin/true\n}\n" >> $startdir/hsmod.install
  
  echo -e "op=\$1\nshift\n\$op \$*" >> $startdir/hsmod.install

  runhaskell Setup.lhs copy --destdir=$startdir/pkg || return 1
  rmdir $startdir/pkg/usr/bin
}

# vim:set ts=2 sw=2 et:
