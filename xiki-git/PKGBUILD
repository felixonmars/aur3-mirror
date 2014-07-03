# Maintainer: Michael Moroni <michael.moroni@mailoo.org>

pkgname=xiki-git
pkgver=1.0.1a
pkgrel=1
pkgdesc="A shell console with GUI features."
arch=(any)
url="http://xiki.org"
license=(MIT)
depends=('ruby')
makedepends=(rubygems)
conflicts=(xiki)
source=(git://github.com/trogdoro/xiki.git)
md5sums=('SKIP')

package() {

  git clone git://github.com/trogdoro/xiki.git
  cd "$srcdir"
  sudo gem install bundler
  bundle
  sudo ruby etc/command/copy_xiki_command_to.rb /usr/bin/xiki

}

# vim:set ts=2 sw=2 et:
