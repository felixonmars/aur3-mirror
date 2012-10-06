# Maintainer: demonicmaniac <namida1@gmx.net>

_pkgname=orp-font
pkgname=$_pkgname-git
pkgver=20121006
pkgrel=1
pkgdesc="A monospaced bitmap font for X11 profont fork"
arch=('any')
url="https://github.com/MicahElliott/Orp-Font"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=orp-font-font.install
conflicts=('proggyfonts')
_gitroot="git://github.com/MicahElliott/Orp-Font.git"
_gitname="Orp-Font"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package () {
  cd "$srcdir/$_gitname-build"

  install -d "$pkgdir/usr/share/fonts/local"
  install -d "$pkgdir/usr/share/doc/$_pkgname"

  install -m644 misc/*.pcf.gz "$pkgdir/usr/share/fonts/local/"
  install -Dm644 README.mkd "$pkgdir/usr/share/doc/$_pkgname/README"
}
