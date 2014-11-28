# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
#
# reason for the git release: bleeding edge full feature build ;)
#
pkgname=giada-git
_gitname=giada
pkgver=791.a33490b
pkgrel=1
pkgdesc="A minimal, hardcore audio tool and loop machine for DJs and live performers (git)"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('libxpm' 'fltk' 'libpulse' 'jack' 'rtmidi>=2.1.0')
makedepends=('git')
install="giada.install"
source=("git+https://github.com/monocasual/giada.git"
    "giada-logo.png"
    "giada.desktop")

md5sums=('SKIP'
         'e712157099a1be39f2adcfc4630d961e'
         '135bef9e2df07b7550a2f4e4358b6933')
         
provides=('giada')
conflicts=('giada')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $_gitname; ./autogen.sh
}


build() {
  cd "$_gitname"
  ./configure --prefix=/usr --target=linux --enable-vst 
  (cd src; make libs)
  make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/giada.desktop" "$pkgdir/usr/share/applications/giada.desktop"
    install -Dm644 "$srcdir/giada-logo.png" "$pkgdir/usr/share/pixmaps/giada.png"
}


