# Maintainer: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=l-smash-tmod-git
_gitname="l-smash"
pkgver=747.ed81e8d
pkgrel=1
pkgdesc="MP4 muxer and other tools"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
url="http://code.google.com/p/l-smash/"
source=('git+https://code.google.com/p/l-smash/'
        http://tmod.nmm-hd.org/L-SMASH/patches/lsmash-install.diff)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  patch -p1 -i "$srcdir/lsmash-install.diff"
}

build() {
  cd $_gitname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('SKIP'
            'be4277c35dd0cbf293311c3a9c12b7530d9cdac66f5e66043f2654e001fe54c5b87eef0505d39ae6edd7923cf81f68d4ad4ed9b68030acbf22c1d8952e55f4a8')
