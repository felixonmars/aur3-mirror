# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name='portspoof'
pkgname="${_name}-git"
pkgver=1.55.13bc332
pkgrel=1
pkgdesc='A lightweight, fast, portable and secure addition to any firewall system or security infrastructure.'
url='http://portspoof.org/'
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('git')
source=("${_name}::git://github.com/drk1wi/${_name}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   echo "1.$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
   cd "${srcdir}/${_name}"
   ./configure --prefix=/usr
   make
}

package() {
   cd "${srcdir}/${_name}"
   make DESTDIR="${pkgdir}" install
}
