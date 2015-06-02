# Maintainer: Brent Carmer <bcarmer@gmail.com>
_pkgname=easycrypt
pkgname=$_pkgname-git

pkgver=ccs14.sfe.r782.g440f7e3
pkgver() {
      cd "$_pkgname"
      git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
    }

pkgrel=2
pkgdesc="Computer-aided cryptographic proofs"
url="https://www.easycrypt.info/"
arch=('x86_64' 'i686')
license=('CeCILL-C')
install=($pkgname.install)
depends=('emacs'
         'proofgeneral'
         'z3')
makedepends=('git' 
             'ocaml'
             'opam>=1.2.0')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
conflicts=()
provides=('easycrypt')
md5sums=('SKIP')

source=("git+https://github.com/EasyCrypt/easycrypt.git")

build() {
    mkdir -p build-bin
    repo=$(opam repository | grep easycrypt | wc -l)
    cd $srcdir/$_pkgname
    if [ $repo -eq 0 ]; then 
      opam repository add easycrypt git://github.com/EasyCrypt/opam.git || true
    fi
    opam update
    opam install ec-toolchain -y
    opam install eprover -y
    opam install alt-ergo -y
    #opam install ec-provers -y # tries to install z3, which breaks unless python=python2
    if [ $repo -e 0 ]; then 
      opam repository remove easycrypt
    fi
    make
}

package() {
  cd $srcdir/$_pkgname
  make install PREFIX=$pkgdir/usr
}
