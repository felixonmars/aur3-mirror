# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=doctorjs-git
pkgver=r486.a12c27e
pkgrel=1
pkgdesc="A set of static analysis tools for JavaScript"
arch=('any')
url='http://drjs.org/'
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('nodejs')
makedepends=('git')
provides=('doctorjs')
conflicts=('doctorjs')
source=("git+https://github.com/mozilla/doctorjs.git"
        "git+https://github.com/mozilla/narcissus.git"
        'nodejs10.patch')
md5sums=('SKIP'
         'SKIP'
         'b620f7ca529207cf3c46e9e1455010a6')

pkgver() {
  cd doctorjs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd doctorjs
  git submodule init
  git config submodule.narcissus.url "${srcdir}"/narcissus
  git submodule update

  # do not modify the user's ~/.profile
  sed -i '/^\secho.*$/,+3D' Makefile

  # NodeJS 0.10.x compatibility
  patch -p1 -i "${srcdir}"/nodejs10.patch
}

package() {
  cd doctorjs
  make PREFIX="\"${pkgdir}\""/usr install
}
