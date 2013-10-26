# Maintainer: Jari Vetoniemi <mailroxas at gmail dot com>
_pkgname=spacerocks
pkgname=$_pkgname-git
pkgver=20131017.201
pkgrel=1
pkgdesc="Asteroids clone based on glhck and glfw"
arch=('i686' 'x86_64')
url="http://bzar.github.io/spacerocks/"
license=('CCPL:sa')
makedepends=('git')
depends=('libgl' 'libpng' 'libjpeg' 'sdl_mixer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/bzar/spacerocks.git")
md5sums=('SKIP')
options=(!buildflags)

pkgver() {
   cd "$srcdir/$_pkgname"
   echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
   cd "$srcdir/$_pkgname"
   git submodule update --init --recursive
   cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt
   make
}

package() {
   cd "$srcdir/$_pkgname"
   install -d "${pkgdir}/opt/${_pkgname}"
   cp -r "spacerocks" "${pkgdir}/opt/${_pkgname}/"
   cp -r "img" "${pkgdir}/opt/${_pkgname}/"
   cp -r "snd" "${pkgdir}/opt/${_pkgname}/"
   cp -r "fonts" "${pkgdir}/opt/${_pkgname}/"
   install -d "${pkgdir}/usr/bin"

   # make scoring work
   install -d -m777 "${pkgdir}/opt/${_pkgname}/scores"
   ln -s "scores/scores.enc" "${pkgdir}/opt/${_pkgname}/scores.enc"

   # we need this as the program expect to be launched from the same directory it resides in
   echo "#!/bin/sh" > "${pkgdir}/usr/bin/${_pkgname}"
   echo "pushd \"/opt/${_pkgname}\" &> /dev/null" >> "${pkgdir}/usr/bin/${_pkgname}"
   echo "exec ./spacerocks" >> "${pkgdir}/usr/bin/${_pkgname}"
   echo "popd &> /dev/null" >> "${pkgdir}/usr/bin/${_pkgname}"
   chmod 0755 "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: set ts=8 sw=3 tw=0 :
