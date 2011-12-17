# Maintainer: Dan Serban

pkgname=mendeleydesktop-from-deb
pkgver=1.x.x.latest
pkgrel=1
pkgdesc="Academic software for managing and sharing research papers (desktop client)"
url=http://www.mendeley.com/release-notes/
arch=(i686 x86_64)
depends=(python2 qt sqlite3)
makedepends=(lynx)
license=(custom:mendeley_eula)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64

build()
{
  rm mendeleydesktop*.deb 2>/dev/null || true
  _url=$(lynx -dump http://www.mendeley.com/repositories/xUbuntu_11.04/${_filearch}/ | grep -o http.*deb | tr '.' 'z' | sort | tail -1 | tr 'z' '.')
  wget "${_url}"
  bsdtar -xf $(basename "${_url}") data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz
  sed -i 's/python$/python2/' "${pkgdir}"/usr/bin/mendeleydesktop
}

