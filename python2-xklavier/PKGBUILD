# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>
pkgname=python2-xklavier
pkgver=0.4
pkgrel=1
pkgdesc="Python2 Bindings for libxklavier."
arch=('i686' 'x86_64')
url="http://devel.randomink.org/projects/python-xklavier"
license=('LGPL')
depends=('libxklavier>=5.0' 'python2>=2.5' 'pygobject>=2.6.2' 'gtk2')
makedepends=('python2>=2.5')
source=('http://ftp.de.debian.org/debian/pool/main/p/python-xklavier/python-xklavier_0.4.orig.tar.gz')
md5sums=('25c922c12bff8eb03de56e1cf914b1f4')
options=('!libtool')
build() {
  cd "${srcdir}/python-xklavier-${pkgver}"

  PYTHON=python2 ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
