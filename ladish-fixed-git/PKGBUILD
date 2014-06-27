# Maintainer: Yenals <yenal.lane@gmail.com>

pkgname=('ladish-fixed-git')
pkgver=0.2.r630.geaf678e
pkgrel=1
pkgdesc="A session management system for JACK applications on GNU/Linux"
arch=('i686' 'x86_64')
url="http://ladish.org/"
license=('GPL')
groups=()
depends=('jack2' 'python' 'libgnomecanvasmm' 'dbus-glib')
optdepends=()
makedepends=('git' 'waf' 'intltool' 'boost')
provides=("ladish=${pkgver}")
conflicts=('ladish')
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=("${pkgname}::git://github.com/LADI/ladish.git")
noextract=()
sha256sums=('SKIP') # update with 'updpkgsums'

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export PYTHON=/usr/bin/python2
  cd "${srcdir}/${pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf
}

package_ladish-fixed-git() {
  cd "${srcdir}/${pkgname}"
  python2 waf install --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
