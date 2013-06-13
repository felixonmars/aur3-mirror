# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=dudle-bzr
pkgver=566
pkgrel=2
pkgdesc="Online scheduling application similar to Doodle"
arch=(any)
url="https://dudle.inf.tu-dresden.de"
license=('AFGPL3')
depends=('ruby' 'ruby-gettext')
makedepends=('bzr')
optdepends=('ruby-atom: Atom feed support')
source=('dudle::bzr+https://dudle.inf.tu-dresden.de'
        'dudle.service')
sha512sums=('SKIP'
            '2199372422ba133ad152c101830ee928813fd3f8b2d3c14981d4175925f067123bcbb0378a83237454d6b7e1c1b03194b68884c958924a27a363db8785b3dceb')

pkgver() {
  cd "$SRCDEST/dudle"
  bzr revno
}

package() {
  cd "$srcdir/dudle"
  mkdir -p $pkgdir/usr/share/webapps/dudle
  cp -r * $pkgdir/usr/share/webapps/dudle
  install -Dm644 "${srcdir}/dudle.service" "${pkgdir}/usr/lib/systemd/system/dudle.service"
}

# vim:set ts=2 sw=2 et:
