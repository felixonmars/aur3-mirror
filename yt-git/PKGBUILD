# Maintainer: Tyler Cone <herrflockig@gmail.com>
pkgname=yt-git
pkgver=20130125
pkgrel=1
pkgdesc="A curses Youtube search client written in python"
arch=('any')
url="https://github.com/herrflockig/yt"
license=('custom:WTFPL')
depends=('mplayer' 'youtube-dl' 'python2')
makedepends=('git')
conflicts=('yt')
provides=('yt')

_gitname="yt"
_gitroot="https://github.com/herrflockig/yt"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
 cd $srcdir
 msg "Connecting to GIT server..."
 if [ -d $_gitname ]; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"
}


package() {
  cd "$srcdir/$_gitname"
  install -Dm755 yt.py "$pkgdir/usr/bin/yt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
