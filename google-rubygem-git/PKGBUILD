# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=google-rubygem-git
_pkgname=google
pkgver=v1.0.6.7.g6238284
pkgver(){ 
  cd $_pkgname
  git describe --tags | sed 's/-/./g'
}
pkgrel=1
pkgdesc="The power of Google Search in your command line."
arch=('i686' 'x86_64')
url="https://github.com/Kerrick/google"
license=('GPL')
depends=(ruby)
makedepends=('git')

epoch=1
source=("$_pkgname::git://github.com/Kerrick/google.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/bin/"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --install-dir "$pkgdir$_gemdir" --bindir "$pkgdir/usr/bin" google
}

# vim:set ts=2 sw=2 et:
