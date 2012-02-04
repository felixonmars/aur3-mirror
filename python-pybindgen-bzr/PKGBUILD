# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Remous-Aris Koutsiamanis <ariskou@gmail.com>
pkgname=python-pybindgen-bzr
_revision=768
pkgver=0.14.1.$_revision
pkgrel=1
pkgdesc="A tool to generate Python bindings for C/C++ code"
url="http://pypi.python.org/pypi/PyBindGen"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python')
makedepends=('python-waf' 'bzr')
source=()
md5sums=()
install=

build() {
  bzr branch -r $_revision lp:pybindgen
  cd $startdir/src/pybindgen
  ./waf configure --prefix=/usr || return 1
  ./waf || return 1
  ./waf install --prefix=/usr --destdir=$startdir/pkg || return 1
}
