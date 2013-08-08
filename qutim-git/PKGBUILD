
# Contributor: Anischenko Alexandr <dganic@bmail.ru>
# Maintainer:  Anischenko Alexandr <dganic@bmail.ru>

pkgname=qutim-git
_gitname=qutim
pkgver=v0.3.1.789.gf4db6b7
pkgrel=1
pkgdesc="Multiplatform instant messenger. GIT repository. Unstable version for developers."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('LGPL' 'GPL3')
depends=('qt4' 'qtwebkit' 'openssl' 'libxss' 'gnutls' 'zlib' 'qca-ossl' 'qca'  'cyrus-sasl' 'attica' 'sdl' 'sdl_mixer' 'aspell' 'libotr3' )
makedepends=('gcc' 'make' 'cmake' 'git' 'jreen-git' 'pkgconfig' 'libpurple')
options=()
conflicts=(qutim-0.2_ru-git, qutim-0.3-git)
provides=()
replaces=(qutim-0.2.80.00-meta-git)
source=('qutim::git+https://github.com/euroelessar/qutim#branch=qt4')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

_cmakekeys="-DCMAKE_BUILD_TYPE=Release
            -DQRCICONS=0
            -DQMLCHAT:BOOL=0
            -DKINETICPOPUPS:BOOL=0
            -DASTRAL:BOOL=0
            -DPLUGMAN:BOOL=0
            -DDOCKTILE:BOOL=0
            -DSCRIPTAPI:BOOL=0
            -DSTACKEDCHATFORM:BOOL=0
            -DMOBILEABOUT:BOOL=0
            -DKINETICSCROLLER:BOOL=0
            -DWEBKITSTYLE/MAEMO:BOOL=0
            -DMOBILECONTACTINFO:BOOL=0
            -DMOBILESETTINGSDIALOG:BOOL=0
            -DDECLARATIVE_UI:BOOL=0
            -DSYMBIANINTEGRATION:BOOL=0
            -DMACINTEGRATION:BOOL=0
            -DMAEMO5INTEGRATION:BOOL=0
            -DMEEGOINTEGRATION:BOOL=0
            -DMULTIMEDIABACKEND:BOOL=0
            -DANTIBOSS:BOOL=0
            -DWININTEGRATION:BOOL=0
            -DVIDROBACKEND:BOOL=0
            -DSYSTEM_JREEN:BOOL=1
            -DCMAKE_INSTALL_PREFIX=/usr"

build() {
# remove "--as-needed" from LDFLAGS
    unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"

  cd $_gitname
  git submodule update --init --recursive
  cmake $_cmakekeys || return 1
  make  || return 1
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
