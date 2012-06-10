# Maintainer: demonicmaniac <namida1@gmx.net>
pkgname=tekui-hg
pkgver=135
pkgrel=1
pkgdesc="A small, freestanding and portable GUI toolkit written in Lua and C."
arch=('i686' 'x86_64')
url="http://tekui.neoscientists.org"
license=('GPL')
depends=('lua' 'freetype2' 'libx11' 'libxft' 'fontconfig' 'libxxf86vm')
makedepends=('mercurial')
optdepends=('directfb: for the directfb driver')
provides=('tekui')
conflicts=('tekui')

_hgroot="http://hg.neoscientists.org"
_hgrepo="tekui"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

        sed -i 's|usr/local|usr|g' config
        sed -i "s|/usr/lib/lua/5.1|${pkgdir}/usr/lib/lua/5.1|g" config
        sed -i "s|/usr/share/lua/5.1|${pkgdir}/usr/share/lua/5.1|g" config
	sed -i "s|OPT = |OPT = $CFLAGS |g" config
        make all || return 1

}

package() {
          cd ${srcdir}/$_hgrepo-build

        make DESTDIR=${pkgdir} install

} 
