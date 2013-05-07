# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=midori-granite-git
pkgver=0.5.0.119
pkgrel=1
pkgdesc='Lightweight web browser based on Gtk WebKit'
arch=('i686' 'x86_64')
url="http://twotoasts.de/index.php/midori/"
license=('LGPL2.1')
depends=('gcr' 'granite-bzr' 'libnotify' 'libunique3' 'libxss' 'libzeitgeist' 'webkitgtk3')
makedepends=('clutter-gtk' 'git' 'gtk-doc' 'intltool' 'librsvg' 'libxml2' 'python2' 'vala')
optdepends=('gstreamer0.10-ugly-plugins: HTML5 videos support'
            'aria2: Download utility')
provides=("${pkgname%-*}" "${pkgname%%-*}")
conflicts=("${pkgname%-*}" "${pkgname%%-*}")
options=('!emptydirs')
install=${pkgname%-*}.install
source=("git://git.xfce.org/apps/${pkgname%%-*}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%%-*}

  git describe | sed 's/\(.*-.*\)-.*/\1/ ; s/-/./'
}

prepare() {
  cd "${srcdir}"/${pkgname%%-*}

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

build() {
  cd "${srcdir}"/${pkgname%%-*}

  export PYTHON=/usr/bin/python2
  ./configure --prefix=/usr --jobs=${MAKEFLAGS/-j/} --enable-{addons,apidocs,docs,granite,gtk3,nls,unique}
  make
}

package() {
  cd "${srcdir}"/${pkgname%%-*}

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
