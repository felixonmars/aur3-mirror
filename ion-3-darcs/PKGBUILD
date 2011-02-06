# Maintainer: M Rawash <mrawash@gmail.com>
pkgname="ion-3-darcs"
pkgver=20091110
pkgrel=1
pkgdesc="A tiling tabbed window manager - development branch (A.K.A Ion3+)"
url="http://modeemi.fi/~tuomov/ion"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('libsm' 'libxext')
makedepends=('libtool' 'gettext' 'libextl-darcs')
optdepends=('trayion: systray support')
conflicts=('ion-3' 'ion-3-xft' 'ion-3_xinerama')
replaces=('ion-3' 'ion-3-xft' 'ion-3_xinerama')
source=("system.mk")
md5sums=('07a5d42ef3247b9d842ec0995d232bd7')

_darcstrunk=http://modeemi.fi/~tuomov/repos
_darcsmod=ion-3plus

build() {
  cd "$srcdir"

  msg "Checking for previous build"

  if [ -d $srcdir/$_darcsmod/_darcs ] ; then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --lazy $_darcstrunk/$_darcsmod
  fi

  msg "Starting build..."

  rm -rf "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"

  cp "$srcdir/system.mk" "$srcdir/$_darcsmod-build"
  cd "$srcdir/$_darcsmod-build"

  MAKEFLAGS="" make || return 1
  make PREFIX="$pkgdir/usr" ETCDIR="$pkgdir/etc/ion3" install || return 1

  ln -fs /usr/bin/ion3plus $pkgdir/usr/bin/ion3
  ln -fs /usr/bin/pwm3plus $pkgdir/usr/bin/pwm3
}
