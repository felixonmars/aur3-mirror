# Mainteiner: j.lahav at gmail dot com
# Based on the official Ghc for Archlinux
pkgname=ghc-7.4.2
pkgver=7.4.2
pkgrel=0
pkgdesc="Ghc compatible with haskell-platform-2012.4"
arch=('i686' 'x86_64')
url="http://www.haskell.org/ghc/download_ghc_7_4_2"
license=('custom')
depends=('gmp4')
provides=('ghc')
conflicts=('ghc')
install='ghc.install'
if [ "${CARCH}" = 'x86_64' ]; then
	bits='x86_64'
	md5sums=('de67ecfe619b0126d8a8b93d26f34555'
           'c367ef26300648ee9b8aca3dee5c9669')
elif [ "${CARCH}" = 'i686' ]; then
	bits='i386'
	md5sums=('7c454da352c4ceb8cf3c75d258bb6ed1'
           'c367ef26300648ee9b8aca3dee5c9669')
fi
source=("http://www.haskell.org/ghc/dist/7.4.2/ghc-7.4.2-${bits}-unknown-linux.tar.bz2"
	'build.mk')

build() {
  cd ghc-${pkgver}

  cp ${srcdir}/build.mk mk/build.mk

  ./configure \
    --prefix=/usr
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/usr/share/licenses/ghc
  install -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/ghc
}
