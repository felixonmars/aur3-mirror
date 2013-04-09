# Contributor: birdflesh <antkoul at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=mangonel-sandsmark-git
_gitname="Mangonel"
pkgver=2013.01.06
pkgrel=1
epoch=1
pkgdesc="Simple but fast application launcher (Sandsmark's fork)."
arch=('i686' 'x86_64')
url=https://github.com/sandsmark/Mangonel/
license=('Apache 2.0')
depends=()
optdepends=()
makedepends=('git' 'automoc4')
provides=('mangonel')
conflicts=('mangonel')
source=("git://github.com/sandsmark/Mangonel.git")
md5sums=('SKIP')

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
        cd "$srcdir/$_gitname"
        cmake . -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        make
}

package() {
        cd "$srcdir/$_gitname"
        make DESTDIR="$pkgdir" install
}

