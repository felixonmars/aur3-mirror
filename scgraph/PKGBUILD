# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: hb <hb.at.music-nerds.dot.net>

_commit=ceee30266b2036dfee2c719b9012a76af0046851
pkgname=scgraph
pkgver=0.13.r170
pkgrel=1
pkgdesc="A 3D graphics server for SuperCollider."
arch=('i686' 'x86_64')
url="http://scgraph.github.io/"
license=('GPL')
depends=('supercollider' 'glu')
makedepends=('cmake' 'boost')
install="$pkgname.install"
source=("https://github.com/scgraph/SCGraph/archive/$_commit.tar.gz"
        "$pkgname.sh")
md5sums=('SKIP'
         'f2e25950675c1172c5fccd48c89b70de')

prepare() {
  cd SCGraph-$_commit
  [ -d b ] || mkdir b

  export LDFLAGS=${LDFLAGS/,--as-needed}

  # right header path
  sed -i 's|/include||;s|\(server\)/plugins|\1|' src{,/plugins}/CMakeLists.txt
}

build() {
  cd SCGraph-$_commit/b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_SKIP_RPATH=ON \
           -DSC3_LIBRARY_PATH:PATH=/usr/lib \
           -DSC3_SOURCES_PATH=/usr/include/SuperCollider \
           -DJACK=1
  # -DSHADERS=1 -DTEXT=1 -DVIDEO=1 - not implemented yet (broken)
  make
  # VERBOSE=1
}

package() {
  cd SCGraph-$_commit/b
  make DESTDIR="$pkgdir/" install

  # profile.d exports
  install -Dm755 "$srcdir/$pkgname.sh" \
    "$pkgdir/etc/profile.d/$pkgname.sh"
}
