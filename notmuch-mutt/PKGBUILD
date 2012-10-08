# Maintainer: Nicolas Estibals <Nicolas.Estibals@gmail.com>
# Contributor: gammel.holte
pkgname=notmuch-mutt
pkgver=0.14
pkgrel=1
pkgdesc="Notmuch (of a) helper for Mutt"
url="http://upsilon.cc/~zack/blog/posts/2011/01/how_to_use_Notmuch_with_Mutt/"
replaces=('mutt-notmuch')
conflicts=('mutt-notmuch')
arch=('any')
license=('GPL3')
depends=('perl' 'perl-mailtools' 'perl-mail-box' 'notmuch' 'perl-term-readline-gnu' 'perl-string-shellquote' 'perl-file-which')
source=(http://notmuchmail.org/releases/notmuch-${pkgver}.tar.gz)
sha1sums=('ad1ef9c2d29cfb0faab7837968d11325dee404bd')


build() {
  cd "${srcdir}/notmuch-${pkgver}/contrib/${pkgname}"
  make ${pkgname}.1
}

package() {
  cd "${srcdir}/notmuch-${pkgver}/contrib/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
