# Contributor: Nekmo <contacto@nekmo.com>

pkgname=fixname
pkgver=1.0
pkgrel=1
pkgdesc="This program allows you to rename file names with incorrects character encodings (aka, '�'), very easily."
arch=(any)
url="http://nekmo.com"
license=('GPL')
depends=('python2>=2.7.0')
makedepends=("mercurial")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
md5sums=() #generate with 'makepkg -g'

_hgroot="https://bitbucket.org/Nekmo/${pkgname}"

echo $_hgrepo
build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "${pkgname}" ]]; then
    cd "${_hgrepo}"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "${_hgroot}"
  fi

  msg "Mercurial checkout done or server timeout"

}

package() {
  cd "${pkgname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: