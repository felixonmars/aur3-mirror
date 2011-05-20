# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=sv-helper
pkgver=0.72
pkgrel=1
pkgdesc="Helpers to make using runit-run-git or runit-dietlibc easier to use"
arch=(i686 x86_64)
url="http://github.com/rubyists/sv-helper"
license=('MIT')
depends=('runit-dietlibc')
optdepends=('runit-services-git: for a variety of pre-made services' 'runit-run-git: to boot with runit as a pid 1 replacement')
source=(sv-helper.sh README.md)
md5sums=('4e4fd427732bc47aca30e912258ccf16'
         '415fd25f146edc186c21a902a1fb7e15')

package() {
  install -D -m 0755 sv-helper.sh "$pkgdir/usr/bin/sv-helper"
  install -D -m 0644 README.md "$pkgdir/usr/share/doc/sv-helper/README.md"
  cd "$pkgdir/usr/bin"
  for sv in sv-list svls sv-enable sv-disable sv-find;do
    ln -s sv-helper $sv
  done
}

# vim:set ts=2 sw=2 et:
