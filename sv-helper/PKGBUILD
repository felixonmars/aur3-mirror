# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=sv-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="Helpers to make using runit-run, runit-services and runit-dietlibc easier to use"
arch=(i686 x86_64)
url="http://github.com/rubyists/sv-helper"
license=('MIT')
depends=('runit-dietlibc')
optdepends=('runit-services: for a variety of pre-made services' 'runit-run: to boot with runit as a pid 1 replacement')
source=(sv-helper.sh README.md)
md5sums=('308ac1f860a3ea6ab67cffd16fccb7b9'
         '415fd25f146edc186c21a902a1fb7e15')

package() {
  install -D -m 0755 sv-helper.sh "$pkgdir/usr/bin/sv-helper"
  install -D -m 0644 README.md "$pkgdir/usr/share/doc/sv-helper/README.md"
  cd "$pkgdir/usr/bin"
  for sv in sv-start sv-stop sv-restart sv-list svls sv-enable sv-disable sv-find;do
    ln -s sv-helper $sv
  done
}

# vim:set ts=2 sw=2 et:
