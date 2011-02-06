# Contributor: rabyte <rabyte__gmail>
# Maintainer: Gonzalo Lorca <human at vtr.net>  
pkgname=glista
pkgver=0.4
pkgrel=3
pkgdesc="A very simple personal to-do list manager."
arch=('i686' 'x86_64')
url="http://prematureoptimization.org/glista/"
license=('GPL3')
depends=('gtkspell>=2.0.15' 'libunique>=1.0.8')
source=(http://glista.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('db4afe3ba157232a6debe58885c693e6')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="/usr" || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
