# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

# This package exists because unity-lens-files is incompatible with zeitgeist
# 0.9.12

pkgname=zeitgeist-compat
pkgver=0.9.5
pkgrel=1
pkgdesc="A service which logs the users's activities and events and makes relevant information available to other applications"
arch=('i686' 'x86_64')
url="http://zeitgeist-project.com/"
license=('GPL')
depends=('python2-dbus' 'python2-gobject2' 'python2-xdg' 'xapian-core')
makedepends=('intltool' 'raptor' 'python2-rdflib')
checkdepends=('vala')
provides=("zeitgeist=${pkgver}")
conflicts=('zeitgeist')
source=("https://launchpad.net/zeitgeist/${pkgver%.*}/${pkgver}/+download/zeitgeist-${pkgver}.tar.bz2")
sha512sums=('26fc041721a9ba99875db7f5bd3cdf91555a3006d0f82186a95b269462334e53f58284d988f0fb9ae39b11679ba08a2992625d3646f697762005803069f1b7ab')

prepare() {
  cd "${srcdir}/zeitgeist-${pkgver}"
  sed -i 's/python -/$PYTHON -/' configure
}

build() {
  cd "${srcdir}/zeitgeist-${pkgver}"
  PYTHON=/usr/bin/python2 LIBS+="-lgmodule-2.0" ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/zeitgeist \
    --localstatedir=/var
  make
}

check() {
  cd "${srcdir}/zeitgeist-${pkgver}"
  make -j1 check
}

package() {
  cd "${srcdir}/zeitgeist-${pkgver}"
  make DESTDIR="${pkgdir}/" zeitgeistdocdir=/usr/share/doc/zeitgeist install
  install -Dm644 data/zeitgeist-daemon.bash_completion \
    "${pkgdir}/usr/share/bash-completion/completions/zeitgeist-daemon"
}
