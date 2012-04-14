pkgname=compizconfig-backend-gconf-bzr
pkgver=163
pkgrel=1
pkgdesc="GConf backend for Compiz"
url="https://launchpad.net/compiz-compizconfig-gconf"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('gconf' 'libcompizconfig-bzr')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-gconf')
conflicts=('compizconfig-backend-gconf')
install='compizconfig-backend-gconf-bzr.install'

_bzrtrunk=lp:compiz-compizconfig-gconf
_bzrmod=compiz-compizconfig-gconf

build()
{
  cd "$srcdir"

  msg "Connecting to Launchpad..."
  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi
  msg "Bazaar checkout done or server timeout."

  rm -rf "$srcdir/$_bzrmod-build"
  msg "Creating build directory..."
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  mkdir "$srcdir/$_bzrmod-build"/build
  cd "$srcdir/$_bzrmod-build/build"

  msg "Running cmake..."
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"             \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo"       \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE           \
    -DCOMPIZ_DESTDIR="${pkgdir}"
  make
}
package() {
  cd "$srcdir/$_bzrmod-build/build"
  make install
}
