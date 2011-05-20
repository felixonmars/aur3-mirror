# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=sv-helper
pkgver=0.12
pkgrel=1
pkgdesc="Helpers to make using runit-run-git or runit-dietlibc easier to use"
arch=(i686 x86_64)
url="http://github.com/rubyists/sv-helper"
license=('MIT')
depends=('runit-dietlibc')
optdepends=('runit-services-git: for a variety of pre-made services' 'runit-run-git: to boot with runit as a pid 1 replacement')
source=(sv-helper.sh)
md5sums=('f15e1cbc3131d8e67949d17691c7ec5f')

package() {
  install -D -m 0755 sv-helper.sh "$pkgdir/usr/bin/sv-helper"
  cd "$pkgdir/usr/bin"
  for sv in sv-list svls sv-enable sv-disable sv-find;do
    ln -s sv-helper $sv
  done
}

# vim:set ts=2 sw=2 et:
