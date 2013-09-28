# Maintainer: David Basoko <basoko@gmail.com>
_gitname=jssip
pkgname=$_gitname-git
pkgver=0.3.0
pkgrel=1
pkgdesc="JsSIP, the JavaScript SIP library"
arch=(any)
url="http://www.jssip.net/"
provides=("$_gitname")
license=('MIT')
makedepends=('git' 'nodejs')
source=("$_gitname"::'git+https://github.com/versatica/JsSIP.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
  cd "$_gitname"
  npm install -d
  node_modules/grunt-cli/bin/grunt
}

package() {
  cd "$_gitname"
  install -d "$pkgdir/usr/share/$pkgname"
  install -D -m644 dist/jssip-*.js "$pkgdir/usr/share/$pkgname/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}