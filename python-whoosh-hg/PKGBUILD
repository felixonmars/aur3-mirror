# Contributor: Frank Smit <frank/61924/nl>

pkgname="python-whoosh-hg"
pkgver=432
pkgrel=2
source=()
md5sums=()

url="http://bitbucket.org/mchaput/whoosh"
pkgdesc="Whoosh is a fast, featureful full-text indexing and searching library implemented in pure Python."
license=('Apache')

arch=('x86_64' 'i686')

_hgroot="http://bitbucket.org/mchaput"
_hgrepo="whoosh"

depends=('python2')
makedepends=('mercurial')

build () {
  cd $srcdir
  msg "Connecting to Mercurial server..."
  if [[ -d "${_hgrepo}/.hg" ]]; then
    ( cd $_hgrepo && hg pull -u )
  else
    hg clone "${_hgroot}/${_hgrepo}"
  fi
  cd "${_hgrepo}"

  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
