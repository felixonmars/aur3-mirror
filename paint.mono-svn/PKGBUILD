# Contributor: raca <raca@algohumano.net>
# Contributor: Vithon <ratm@archlinux.us>

pkgname='paint.mono-svn'
pkgver=63
pkgrel=1
pkgdesc="A paint.NET port to mono"
arch=('i686' 'x86_64')
url="http://code.google.com/p/paint-mono"
license=('MIT')
depends=('mono')
makedepends=('subversion' 'fakeroot')
conflicts=('paint.mono')
options=(!strip !docs !makeflags)
install='paint.mono.install'
source=('paint.mono.install' 'paint.mono.desktop' 'LICENSE')
md5sums=('276b45a5148f75e66398e420828312f0'
         'ae1941b31825f314bc71ad880f0ebbc5'
	 '4bbe82aec78932db45b6695cf7777648')

_svntrunk=http://paint-mono.googlecode.com/svn/trunk/
_svnmod=paint.mono

_progname=paint.mono

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod/src

  #
  # BUILD
  #

  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p ${MONO_SHARED_DIR}

  ./configure --prefix=/usr/share/${_progname}
  make || return 1
  make DESTDIR=$pkgdir install

  # install desktop file
  install -Dm644 ${srcdir}/${_progname}.desktop \
    ${pkgdir}/usr/share/applications/${_progname}.desktop

  # install icon file
  install -Dm644 ${srcdir}/$_svnmod-build/src/Resources/Images/Icon50x50.png \
    ${pkgdir}/usr/share/paint.mono/Icon50x50.png

  # instal paint.mono bin
  install -Dm755 ${pkgdir}/usr/share/${_progname}/bin/paintdotnet \
    ${pkgdir}/usr/bin/${_progname}

  # install license
  install -Dm644 ${srcdir}/$_svnmod-build/src/Resources/Files/License.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  rm -rf "${MONO_SHARED_DIR}"
}
