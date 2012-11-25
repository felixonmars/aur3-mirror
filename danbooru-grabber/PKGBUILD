# Maintainer: Bapabooiee <bapabooiee at gmail dot com>

pkgname=danbooru-grabber
_pkgname=danbooru-v7sh-grabber
pkgver=0.20.21
pkgrel=1
pkgdesc="POSIX-compliant shell script for downloading images from Danbooru"
arch=('any')
url="http://code.google.com/p/danbooru-v7sh-grabber/"
license=('custom:"WTFPL2"')
depends=('wget')
source=("http://$_pkgname.googlecode.com/files/$_pkgname-v$pkgver.tar.gz" 'LICENSE')
md5sums=('31e7ad5f42f3dce73da21e2b9ba37192'
         '330100b7a3cb7ad8f52583811bf01a2b')

package() {
  cd "${srcdir}"/${_pkgname}-v${pkgver}

  install -D -m755 ${_pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
