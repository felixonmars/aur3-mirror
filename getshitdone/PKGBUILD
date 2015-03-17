# Maintainer: gh0st <echo ZGV2QGFudGktc3R1ZGlvLmV1Cg==|base64 -d>
# Contributor: zi <zi@irc.freenode.net>
pkgname=getshitdone
_gitname=get-shit-done
pkgver=d0d04e7
pkgrel=1
pkgdesc="Get-shit-done from git."
license=('GPL')
arch=('any')
url="https://github.com/leftnode/get-shit-done"
makedepends=('git')
depends=('php' 'python' 'bash')
provides=($_gitname)
conflicts=($_gitname)
options=()
source=(get-shit-done::git+https://github.com/leftnode/get-shit-done)
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  echo 'rm -rf ~' # read your PKGBUILDs!
  echo 'append :/usr/bin:/etc:/root to "open_basedir = " in /etc/php/php.ini'
}

package() {
  install -Dm755 get-shit-done/get-shit-done "/$pkgdir/usr/bin/get-shit-done"
  install -Dm755 get-shit-done/get-shit-done.php "/$pkgdir/usr/bin/get-shit-done.php"
  install -Dm755 get-shit-done/get-shit-done.py "/$pkgdir/usr/bin/get-shit-done.py"
  install -Dm755 get-shit-done/get-shit-done.sh "/$pkgdir/usr/bin/get-shit-done.sh"
  install -Dm644 get-shit-done/sites.ini "/$pkgdir/usr/bin/sites.ini"
}
