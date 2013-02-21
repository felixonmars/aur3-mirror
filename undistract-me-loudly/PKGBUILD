# Maintainer: kozec <kozec at kozec dot com>
# Based on undistract-me-git package by Doug Newgard

pkgname=undistract-me-loudly
pkgver=20130220
pkgrel=1
pkgdesc="Alerts you when long-running commands finally complete, with sound and clickable notification"
arch=('any')
url="http://mumak.net/undistract-me/"
license=('Expat')
depends=('bash' 'notification-daemon' 'xorg-xprop' 'wmctrl' 'python2-notify' 'libpulse')
makedepends=('git')
install=undistract-me.install
source=('101246__tomlija__metal-glass-makes-long-ping-sound.aif' patch.patch notify.py)
conflicts=('undistract-me-git')
provides=("undistract-me-git=$pkgver")

_gitroot=https://github.com/jml/undistract-me.git
_gitname=undistract-me

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

  [ -d "$srcdir/$_gitname-build" ] && rm -R "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build" || return 1
  cd "$srcdir/$_gitname-build"
  patch -Np1 -i "$srcdir/patch.patch" || return 1

}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 long-running.bash "$pkgdir/usr/share/$_gitname/long-running.bash"
  install -Dm755 preexec.bash "$pkgdir/usr/share/$_gitname/preexec.bash"
  install -Dm644 README.md "$pkgdir/usr/share/$_gitname/README.md"
  install -Dm755 undistract-me.sh "$pkgdir/etc/profile.d/undistract-me.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/101246__tomlija__metal-glass-makes-long-ping-sound.aif" "$pkgdir/usr/share/$_gitname/101246__tomlija__metal-glass-makes-long-ping-sound.aif"
  install -Dm755 "$srcdir/notify.py" "$pkgdir/usr/share/$_gitname/notify.py"
}

md5sums=('bbe0f2a0e94c700795036c688f946ddd'
         '906cb97f8472dddd60ade6657e8f48d4'
         'fdba96ec7918599bf9436e0c719767d0')
