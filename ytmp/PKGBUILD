# Contributor: Benjamin Wild <benwild@gmx.de>
pkgname=ytmp
pkgver=20100914
pkgrel=1
pkgdesc="automatically play youtube videos with mplayer and ngrep"
arch=('any')
url="http://github.com/tlvince/ytmp"
license=('GPL')
depends=('ngrep' 'youtube-dl')
optdepends=('zenity: for gtk gui support' 'kdialog: for kde gui support' 'dmenu: for dmenu gui support')
makedepends=('git')
backup=('etc/ytmp.conf')

_gitroot="git://github.com/tlvince/ytmp.git"
_gitname="ytmp"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  mkdir -p "$pkgdir"/usr/lib/tlvince
  cd "$srcdir/$_gitname-build"
  install -Dm744 ytmpd "$pkgdir"/usr/bin/ytmpd
  install -Dm644 ytmp.conf "$pkgdir"/etc/ytmp.conf
  install -m755 ytmpc "$pkgdir"/usr/bin/ytmpc
  install -Dm744 distro-specific/arch/ytmpd_init "$pkgdir"/etc/rc.d/ytmpd
  install -Dm644 lib/* "$pkgdir"/usr/lib/tlvince/
}
