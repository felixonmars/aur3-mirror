# Maintainer: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=echoprint-codegen-git
pkgver=20110713
pkgrel=1
pkgdesc="music fingerprint and resolving framework powered by The Echo Nest"
arch=(i686 x86_64)
url="http://echoprint.me/"
license=('MIT')
depends=('ffmpeg' 'taglib')
makedepends=('git' 'boost')
provides=(echoprint-codegen)
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/echonest/echoprint-codegen.git"
_gitname="echoprint-codegen"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make -C src
}

package() {
  cd "$srcdir/$_gitname-build"
  make -C src PREFIX=${pkgdir}/usr install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
