# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=undistract-me-bzr
pkgver=15
pkgrel=1
pkgdesc="Alerts you when long-running commands finally complete"
arch=('any')
url="http://mumak.net/undistract-me/"
license=('Expat')
depends=('bash' 'notification-daemon')
makedepends=('bzr')
install=undistract-me.install

_bzrtrunk=http://bazaar.launchpad.net/~undistract-me-dev/undistract-me/trunk
_bzrmod=undistract-me

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
}

package() {
  cd "$srcdir/$_bzrmod"

  install -Dm755 long-running.bash "$pkgdir/usr/share/$_bzrmod/long-running.bash"
  install -Dm755 preexec.bash "$pkgdir/usr/share/$_bzrmod/preexec.bash"
  install -Dm644 README.md "$pkgdir/usr/share/$_bzrmod/README.md"
  install -Dm755 undistract-me.sh "$pkgdir/etc/profile.d/undistract-me.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
