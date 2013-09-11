# Maintainer: J Honorio Casado Fdez <jhcasado@cuantobit.com>
# Contributor: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
# Contributor: Adlai Chandrasekhar <munchking@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>

pkgname=cdm-simple-git
_pkgname=cdm-simple
pkgver=1.0
pkgrel=1
pkgdesc="Simple Console Display Manager that supports .xinitrc, default selection with timeout, doesn't depend on dialog/ncurses and doesn't clear the screen."
arch=('any')
url="https://github.com/jhcasado/cdm-simple"
license=('GPL')
makedepends=('tar')
depends=('bash')
provides=('cdm')
conflicts=('cdm')
backup=('etc/cdmrc')
source=("https://github.com/jhcasado/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('30efec7fdeb5309ff2cf59f8417680c5')

package() {
  install -d ${pkgdir}/{usr/{bin,share/doc/cdm,share/cdm},etc/profile.d}

  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/cdm" README.md
  install -Dm644 -T README.md "$pkgdir/usr/share/doc/cdm/README"

  cd "$srcdir/$_pkgname-$pkgver/src"
  install -Dm755 -t "$pkgdir/usr/bin" cdm cdm-xlaunch
  install -Dm644 -t "$pkgdir/etc" cdmrc
  install -Dm644 -t "$pkgdir/usr/share/cdm" cdm-profile.sh
  install -Dm755 -T cdm-profile.sh "$pkgdir/etc/profile.d/zzz-cdm-profile.sh"
}
