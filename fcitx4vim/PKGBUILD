# Maintainer: yetist <yetist@gmail.com>

pkgname=fcitx4vim
_pkgname=fcitx
pkgver=3.6.1
pkgrel=5
pkgdesc="Fcitx for vim, auto change ime state when vim mode(normal/input) change"
arch=('i686' 'x86_64')
url="http://www.fcitx.org/"
license=('GPL')
depends=('libxft' 'libxpm' 'libxtst')
conflicts=('fcitx')
provides=('fcitx')
replaces=('fcitx')
install=fcitx.install
source=(http://www.fcitx.org/download/${_pkgname}-${pkgver}.tar.bz2
client-test.c
ImeRemote.patch)
md5sums=('1b8090ddda099ea9b381abcc2bfae24e'
         '8bf15d4d2f9948f6ebad14aebcfaf316'
         '27386b5dbe18af4b73348e39ed3864aa')

build() {
  gcc -o fcitx-remote client-test.c
  install -Dm755 fcitx-remote $pkgdir/usr/bin/fcitx-remote
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p0 < $srcdir/ImeRemote.patch
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
