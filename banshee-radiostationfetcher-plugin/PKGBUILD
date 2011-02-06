#######################################
#        Paweł (Smeagol) Bogut        #
#                                     #
# JID:          smeagol(at)uaznia.net #
# eMail:            aur(at)smg.int.pl #
#######################################
pkgname=banshee-radiostationfetcher-plugin
pkgver=0.1
pkgrel=1
pkgdesc="Extension for banshee that allows users to fetch radiostations from www.shoutcast.com and www.xiph.org."
arch=('i686' 'x86_64')
url="http://code.google.com/p/banshee-radiostationfetcher/"
license="MIT"
depends=('banshee')
source=(http://banshee-radiostationfetcher.googlecode.com/files/banshee-radiostationfetcher-${pkgver}.tar.gz)
md5sums=('675f85bfaa2f2eddbf2a62d951e2882b')

build() {
  cd ${srcdir}/banshee-radiostationfetcher-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

