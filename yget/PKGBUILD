# Maintainer: Dan Serban
# Contributor: Moritz Wilhelmy

pkgname=yget
pkgver=2.x.x.latest
pkgrel=1
pkgdesc="yget/yplay/yurl help download / stream / retrieve download URLs of Youtube videos"
arch=(any)
url=http://repo.hu/projects/yget/releases/
license=(PublicDomain)
depends=(wget)
makedepends=(lynx)
optdepends=('mplayer: for yplay to stream Youtube videos')

build()
{
  rm yget-*.tar.gz 2>/dev/null || true
  _url=$(lynx -dump http://repo.hu/projects/yget/releases/ | grep -o http.*/yget-.*tar.gz | head -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url})
  cd $(ls -1d yget-*/ | tail -1)
  make install install_root="${pkgdir}"
}
