# Contributor: Nygel Lyndley <totem-plugin-lastfm@lyndley.com>

pkgname=totem-plugin-lastfm
pkgver=1.0.1
pkgrel=2
pkgdesc="Plugin for Totem to scrobble audio tracks to Last.fm"
arch=('any')
url="http://www.16kb.co.uk/totem-plugin-lastfm"
license=('GPL')
depends=(totem python gconf)
source=(http://www.16kb.co.uk/static/files/totem-plugin-lastfm/Arch/$pkgname-$pkgver.tar.gz)
md5sums=(a320e5b92ae09bfc60ed1456d0b50c3a)

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  mkdir $pkgdir/usr || return 1
  cp -a lib $pkgdir/usr || return 1
  return 0
}

