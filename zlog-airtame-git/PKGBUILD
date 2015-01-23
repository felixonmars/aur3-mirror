# Maintainer: Lars Hagström <lars@foldspace.nu>
# This package is just a fork of the zlog-git package.

pkgname=zlog-airtame-git
pkgver=1.2.8.69.gc45a1df
pkgrel=1
pkgdesc="A flexible, fast, and thread-safe logger for C. This is the fork made by airtame."
arch=('i686' 'x86_64')
url="http://github.com/airtame"
license=('GPLv3')
makedepends=('git')
provides=('zlog')
conflicts=('zlog')
source=('zlog::git+https://github.com/airtame/zlog.git')
md5sums=('SKIP')
_hgrepo="zlog"

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_hgrepo}"
  make CFLAGS=-Wno-error=cpp
}

package() {
  cd "${srcdir}/${_hgrepo}"
  make PREFIX="${pkgdir}/usr" install
}
