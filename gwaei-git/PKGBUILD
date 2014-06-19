# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=gwaei-git
_pkgname=gwaei
pkgver=r4.12e5ffc
pkgrel=1
pkgdesc="A Japanese-English dictionary program"
arch=('i686' 'x86_64')
url="https://github.com/zakkudo/gwaei"
license=('GPL3')
depends=('curl>=7.18.0' 'gtk3>=3.2' 'mecab' 'hunspell')
makedepends=('git' 'intltool' 'rarian' 'gnome-doc-utils' 'dconf'
             'gsettings-desktop-schemas')
optdepends=('rsync: Provide incremental dictionary updates'
            'ttf-kanjistrokeorders'
            'ttf-arphic-ukai')
source=("${_pkgname}-${pkgver}::git+https://github.com/zakkudo/gwaei")
install="gwaei-git.install"
provides=(gwaei)
conflicts=(gwaei)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}

