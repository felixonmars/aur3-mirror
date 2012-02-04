# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=yass  
pkgver=0.0.2
pkgrel=2
pkgdesc="Yet Another Scrolling Scope"
url="http://www.kokkinizita.net/linuxaudio/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clthreads>=2.2.1' 'clxclient>=3.3.1' 'jack')
source=(http://www.kokkinizita.net/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b41db22c93d9510c396b99e3301df394')

build() {
  cd "${srcdir}/${pkgname}"
  
  sed -i "s|/usr/bin/install|/bin/install|" Makefile
  mkdir -p "${pkgdir}/usr/bin"
  make

  make PREFIX="${pkgdir}/usr" install
}
