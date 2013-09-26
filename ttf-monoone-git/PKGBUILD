# Maintainer: Gregory Eric Sanderson <gregory.eric.sanderson@gmail.com>
pkgname="ttf-monoone-git"
pkgver=1.0
pkgrel=1
pkgdesc="monospaced font for programming and code review"
arch=('any')
url="https://github.com/madmalik/monoOne"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
md5sums=('6ed93967ff0dc6dd9c8d31c17f817a06'
         '87bc0dcff83d90fdda665e62f8c1a93b')
source=('OFL.txt'
        'ttf-monoone-git.install')

_gitroot="https://github.com/madmalik/monoOne.git"
_gitname="monoone"

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
}

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  cp -dpr --no-preserve=ownership ${srcdir}/${_gitname}-build/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}

# vim:set ts=2 sw=2 et:
