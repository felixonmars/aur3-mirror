# Maintainer: TDY <tdy@gmx.com>

pkgname=qute-git
pkgver=20121230
pkgrel=1
pkgdesc="A text editor with Markdown and TeX support"
arch=('i686' 'x86_64')
url="http://www.inkcode.net/qute"
license=('AGPL3')
makedepends=('git' 'python2')
provides=('qute')
conflicts=('qute')
source=(qute.sh qute.desktop)
md5sums=('fecc8fbff2f440cf6d6464162b1572a3'
         '8a72545254dee76520331f5297437638')

_gitroot=https://github.com/fbreuer/qute-html5.git
_gitname=qute-html5

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

  sh bootstrap.sh
  python2 chromeless/chromeless appify src
}

package() {
  cd "$srcdir/$_gitname-build"
  install -dm755 "$pkgdir/opt"
  cp -a chromeless/build/Qute "$pkgdir/opt/qute"

  # enforce perms
  find -type f -exec chmod 644 '{}' \;
  find -type d -exec chmod 755 '{}' \;
  chmod 755 $(find "$pkgdir" -exec file '{}' \;|grep ELF|cut -d: -f1)

  install -Dm644 README.md "$pkgdir/usr/share/doc/qute/README.md"
  install -Dm644 src/img/icon-512.png "$pkgdir/usr/share/pixmaps/qute.png"
  install -Dm644 "$srcdir/qute.desktop" "$pkgdir/usr/share/applications/qute.desktop"
  install -Dm755 "$srcdir/qute.sh" "$pkgdir/usr/bin/qute"
}

# vim:set ts=2 sw=2 et:
