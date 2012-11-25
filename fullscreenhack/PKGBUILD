# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=fullscreenhack
pkgver=20121113
pkgrel=1
pkgdesc="A preload library that fixes fullscreen flash on a multi-head setup"
arch=(x86_64 i686)
url="https://github.com/ali1234/fullscreenhack"
license=('GPL')
depends=(glibc libx11 libxinerama)
optdepends=('firefox: to use the firefox-fullscreenhack script'
            'google-chrome: to use the chrome-fullscreenhack script')
makedepends=('git')
install=fullscreenhack.install
source=(firefox-fullscreenhack.sh
        chrome-fullscreenhack.sh)
md5sums=()

_gitroot=git://github.com/ali1234/fullscreenhack.git
_gitname=fullscreenhack

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -m755 ${pkgdir}/usr/lib
  install -d -m755 ${pkgdir}/usr/bin

  install -m644 libfshack-npapi.so ${pkgdir}/usr/lib/libfshack-npapi.so
  install -m644 libfshack-ppapi.so ${pkgdir}/usr/lib/libfshack-ppapi.so
  install -m755 ${srcdir}/firefox-fullscreenhack.sh ${pkgdir}/usr/bin/firefox-fullscreenhack
  install -m755 ${srcdir}/chrome-fullscreenhack.sh ${pkgdir}/usr/bin/chrome-fullscreenhack
}

md5sums=('a749f63fe347ae8dc796b57af35ef3a5'
         '60955ec08fc5ed6566df573497da01f7')
