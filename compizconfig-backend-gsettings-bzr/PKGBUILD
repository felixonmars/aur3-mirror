pkgname=compizconfig-backend-gsettings-bzr
pkgver=158
pkgrel=2
pkgdesc="GSettings backend for Compiz"
url="https://launchpad.net/compiz-compizconfig-gsettings"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('gconf' 'libcompizconfig-bzr')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-gsettings')
conflicts=('compizconfig-backend-gsettings')
install='compizconfig-backend-gsettings-bzr.install'

_bzrtrunk=lp:compiz-compizconfig-gsettings
_bzrmod=compiz-compizconfig-gsettings

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
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
