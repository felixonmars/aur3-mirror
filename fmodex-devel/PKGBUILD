# Maintainer: 
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fmodex-devel
pkgver=4.41.05
pkgrel=1
pkgdesc="An advanced audio engine"
arch=('i686' 'x86_64')
url="http://www.fmod.org/"
license=('custom')
depends=('gcc-libs')
provides=('fmodex')
conflicts=('fmodex')
md5sums=('1fef1b646f289c87c21d649f525a5823')
[ "$CARCH" = "x86_64" ] && {
	_pkgarch=64
	md5sums=('999852198b34b7fc30ef70f8ed472f76')
}

source=(http://www.fmod.org/index.php/release/version/fmodapi${pkgver//./}linux${_pkgarch}.tar.gz)

package() {
  cd fmodapi${pkgver//./}linux${_pkgarch}

  install -dm755 "${pkgdir}"/usr/lib

  make  DESTLIBDIR="${pkgdir}"/usr/lib \
	DESTHDRDIR="${pkgdir}"/usr/include/fmodex \
	install

  install -Dm644 documentation/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd "${pkgdir}"/usr/lib

  for i in libfmodex{,p}; do
    ln -sf $i$_pkgarch-$pkgver.so $i$_pkgarch.so
    [ "$CARCH" = "x86_64" ] && ln -sf $i$_pkgarch.so $i.so
    :
  done
}
