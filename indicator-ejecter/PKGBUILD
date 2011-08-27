# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=indicator-ejecter
_name=ejecter
pkgver=0.4.4
pkgrel=1
pkgdesc="A small indicator app to help unmount external media"
arch=('i686' 'x86_64')
url="https://launchpad.net/ejecter"
license=('GPL3')
depends=('gtk2>=2.12' 'gnome-disk-utility' 'libnotify' 'indicator-application' 'hicolor-icon-theme' 
'libdbusmenu')
install='ejecter.install'
makedepends=('vala>=0.7.0' 'python2>=2.3' 'intltool' 'gtk-doc')
groups=('ayatana')
source=(http://launchpad.net/${_name}/indicator/$pkgver/+download/${_name}-$pkgver.tar.bz2)
md5sums=('dee1bd75c2cae20367b4fc5b02a03d1f')

build() {
  cd ${_name}-$pkgver
  
  export PYTHON="/usr/bin/python2"
  sed -i 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' ./waf

  ./waf configure --prefix=/usr
  ./waf build || return 1
  ./waf --destdir="$pkgdir" install
}

