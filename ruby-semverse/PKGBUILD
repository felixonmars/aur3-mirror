# $Id$
# Maintainer: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-botocore/PKGBUILD

_gemname=semverse
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc='An elegant library for representing and comparing SemVer versions and constraints'
arch=(any)
url='https://github.com/berkshelf/semverse'
license=('Apache 2.0')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e2cbb535947e37dd92676f89558914594929a32d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
