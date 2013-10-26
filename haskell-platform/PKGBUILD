# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>
# Contributor: Weox <weox dot os at gmail dot com>
# Contributor: JSpaces <jspaces -aT- incentre -d0T- net>

pkgname=haskell-platform
pkgver=2013.2.0.0
pkgrel=3
pkgdesc="Haskell: batteries included"
arch=('x86_64' 'i686')
url="http://www.haskell.org/platform/"
license=('BSD3')
provides=('cabal-install')
conflicts=('cabal-install')
depends=('ghc' 'glut' 'glu' 'mesa')
optdepends=()
makedepends=('expac')
source=("http://lambda.haskell.org/platform/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "install.sh.patch")
sha256sums=('b09ccbf502198655b0c4bbfd9691e6853b998a61bfd805db227cdcd93ab0f3ad'
            '97da9e590c371b329c0a89fbab70d41ce578858bc0dc339a74088104bac0521f')
#install=haskell-platform.install

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   # Patch install.sh to respect $DESTDIR in make install
   # with special thanks to chrisdornan
   # http://trac.haskell.org/haskell-platform/ticket/196
   patch -p1 -i $srcdir/install.sh.patch || die "Patching install.sh failed!"

   # Thanks to JSpaces for this part:
   # If you get a Quick Test error delete or rename your ~/.ghc folder.
   # (e.g. Makefile:9: recipe for target 'build.stamp' failed)

   # Fix GHC_PACKAGE_PATH error.
   sed -i '/GHC_PACKAGE_PATH="${ORIG_GHC_PACKAGE_PATH}"/s/^/#/' scripts/build.sh
   if [[ $(expac -Q '%v' ghc | sed 's/-[0-9]//') == 7.6.3 ]]; then
      ./configure --prefix=${pkgdir}/usr \
      --enable-shared
   else
      ./configure --prefix=${pkdir}/usr \
      --enable-shared \
      --enable-unsupported-ghc-version
   fi   

   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   make DESTDIR="${pkgdir}/usr" install

   # Thanks to JSpaces again:
   # Create licenses folder ...
   install -d "${pkgdir}/usr/share/licenses"
   # Move the license files to correct location.
   mv ${pkgdir}/usr/share/doc/* \
   ${pkgdir}/usr/share/licenses/
   # Move the documents to correct location.
   mv ${pkgdir}/usr/share/{alex-3.0.5,happy-1.18.10,HUnit-1.2.5.2} \
   ${pkgdir}/usr/share/doc/

   # Remove package registration files as I don't know what to do with them.
   # If you have any issues with that, please let me know.
   rm -rf ${pkgdir}/usr/load
}


