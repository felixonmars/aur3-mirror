# $Id$
# Maintainer: hyperfang8@gmail.com

pkgname=kdebase-konsole-xterm
pkgver=20140426
pkgrel=1
arch=('i686' 'x86_64')
url='http://pastebin.com/knychZsM'
pkgdesc="Replaces xterm with kdebase-konsole."
license=('GPL')
groups=('kde')
depends=('kdebase-konsole')
conflicts=('xterm')
provides=('xterm')
makedepends=()
source=('xterm')
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  install -D -m755 xterm "${pkgdir}/usr/bin/xterm"
}