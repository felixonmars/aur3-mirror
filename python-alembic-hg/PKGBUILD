# Maintainer: Jaume Delclòs <jaume at delclos dot com>
pkgname=python-alembic-hg
pkgver=303
#pkgver() {
#  cd "$srcdir/$_hgrepo"
#  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
#}
pkgrel=1
pkgdesc="A lightweight database migration tool for usage with the SQLAlchemy"
arch=('any')
url="https://bitbucket.org/zzzeek/alembic"
license=('MIT')
groups=()
depends=('python' 'python-sqlalchemy')
makedepends=('mercurial')
provides=('python-alembic')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot=https://bitbucket.org/zzzeek/alembic
_hgrepo=alembic

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  python setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


# vim:set ts=2 sw=2 et:
