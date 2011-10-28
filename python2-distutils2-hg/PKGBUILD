# Contributor: meatballhat <daniel.buch@gmail.com>
__capsname=Distutils2
__shortname=distutils2
__pypi="http://pypi.python.org"

pkgname=python2-$__shortname-hg
pkgver=20111028
pkgrel=1
pkgdesc="python distribution utilities"
arch=(any)
url="http://packages.python.org/$__capsname/"
license=("PSF")
groups=()
depends=(python2)
makedepends=()
optdepends=()
provides=($pkgname)
conflicts=('python2-distutils2')
provides=('python2-distutils2')
backup=()
options=(!emptydirs)
install=
noextract=()

_hgtrunk="https://bitbucket.org/tarek/distutils2-new-cmdline/"
_hgmod=$__shortname

build() {
  cd "$srcdir" || return 1
  
  msg "Connect to mercurial repository server..."

  if [ ! -d "$_hgmod"/.hg ]; then
    hg clone "$_hgtrunk" "$_hgmod"
    cd "$_hgmod" || return 1
  else
    cd "$_hgmod" || return 1
    hg pull && hg update
  fi

  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:filetype=sh
