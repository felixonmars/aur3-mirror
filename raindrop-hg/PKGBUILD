# Contributor: fauno <fauno@kiwwwi.com.ar>
pkgname="raindrop-hg"
pkgver=1078
pkgrel=1
pkgdesc="Explore new ways to use Open Web technologies to create useful, compelling messaging experiences"
arch=("i686")
url="http://labs.mozilla.com/raindrop"
license=("MPL")
depends=('paisley' 'pyopenssl' 'couchdb' 'twisted' 'python<3')
makedepends=("mercurial")
provides=()
conflicts=()
replaces=()
source=()
md5sums=()

_hgroot="http://hg.mozilla.org/labs"
_hgrepo="raindrop"

build() {
  msg "Connecting to mercurial repository..."

  cd ${srcdir}

  if [ -d "${hgrepo}" ]; then
    cd ${_hgrepo}
    hg pull -u -r ${pkgver}
  else
    hg clone -r ${pkgver} "${_hgroot}/${_hgrepo}"
    cd ${_hgrepo}
  fi

  msg "Mercurial clone finished."
  install -dm755 $pkgdir/opt/$pkgname || return 1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
  rm LICENSE || return 1
  cp -r * $pkgdir/opt/$pkgname || return 1

}
