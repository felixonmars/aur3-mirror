# Maintainer: Serus

pkgname=l-smash-tmod
_gitname="l-smash"
pkgver=927
pkgrel=1
pkgdesc="MP4 muxer and other tools"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('l-smash' 'liblsmash.so')
conflicts=('l-smash' 'l-smash-git' 'l-smash-tmod-git')
replaces=('l-smash' 'l-smash-git' 'l-smash-tmod-git')
url="http://code.google.com/p/l-smash/"
source=('git+https://code.google.com/p/l-smash/#commit=7390ea7289'
        http://tmod.nmm-hd.org/L-SMASH/patches/lsmash-install.diff)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD)
}

prepare() {
  cd $_gitname
  patch -p1 -i "$srcdir/lsmash-install.diff"
}

build() {
  cd $_gitname
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('SKIP'
            'be4277c35dd0cbf293311c3a9c12b7530d9cdac66f5e66043f2654e001fe54c5b87eef0505d39ae6edd7923cf81f68d4ad4ed9b68030acbf22c1d8952e55f4a8')
