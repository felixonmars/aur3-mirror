# $Id$
# Maintainer: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-wdm/PKGBUILD

_gemname=wdm
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc="Windows Directory Monitor (WDM) is a library which can be used to monitor directories for changes. It's mostly implemented in C and uses the Win32 API for a better performance."
arch=(any)
url="https://github.com/Maher4Ever/wdm"
license=('MIT')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a113b86c051f289152ffbbd4982385bc')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
