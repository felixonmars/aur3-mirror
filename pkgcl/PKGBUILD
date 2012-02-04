# Maintainer/Author: Alex Brown <code@alexpbrown.me>
pkgname=pkgcl
pkgver=0.2.1
pkgrel=1
pkgdesc="Get changelogs for Arch Linux packages"
arch=('any')
url="https://github.com/alexpbrown/arch-pkgcl"
license=('custom:WTFPL')
depends=("ruby" "ruby-nokogiri")
source=($pkgname "LICENSE")
md5sums=('139ea018685a8456ced08b27f65f9098'
         '389a9e29629d1f05e115f8f05c283df5')

package() {
  cd "$srcdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
