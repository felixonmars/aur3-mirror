# Maintainer : x@safe-mail.net where x stands for jbjunk

pkgname=distrho-mverb-lv2-git
pkgver=1
pkgrel=1
pkgdesc="Studio quality, open-source reverb. Its release was intended to provide a practical demonstration of Dattorro’s figure-of-eight reverb structure and provide the open source community with a high quality reverb."
arch=('i686' 'x86_64')
url="https://github.com/DISTRHO/MVerb"
license=('GPL' 'GPL3' 'LGPL')
depends=('lv2' 'alsa-lib' 'libgl' 'libxext')
makedepends=('jack')

md5sums=()

_gitroot=git://github.com/DISTRHO/MVerb.git
_gitname=$pkgname


pkgver() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}


build() {
  cd "$srcdir/$_gitname-build"
  make 
}

package() {
  cd $srcdir/$_gitname-build

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/MVerb.lv2 "$pkgdir/usr/lib/lv2/"
}

# vim:set ts=2 sw=2 et:
