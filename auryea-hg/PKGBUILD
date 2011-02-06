# Contributor: David Gidwani <dav@fudmenot.info>

name=auryea
pkgname="${name}-hg"
pkgver=13
pkgrel=1
source=()
md5sums=()

url="http://bitbucket.org/darvid"
pkgdesc="A dirt simple, mud ugly AUR frontend written in bash. Aw yeah."
license=('GPLv3')

arch=('x86_64' 'i686')

_hgroot=$url
_hgrepo="$name"

depends=()
makedepends=('mercurial' 'coreutils')

build () {
  cd $srcdir
  msg "Connecting to Mercurial server..."
  if [[ -d "${_hgrepo}/.hg" ]]; then
    ( cd $_hgrepo && hg pull -u )
  else
    hg clone "${_hgroot}/${_hgrepo}"
  fi
  cd "${_hgrepo}"
  install -D -m755 "${name}.sh" "${pkgdir}/usr/bin/$name"
}