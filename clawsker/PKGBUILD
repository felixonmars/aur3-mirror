# Maintainer: Francesco Groccia <frgroccia gmail.com>
# Contributor: Jakub "mr.MikyMaus" Fiser <mr@MikyMaus.org>

pkgname=clawsker
pkgver=0.7.8
pkgrel=1
pkgdesc="Clawsker is an applet to edit Claws Mail's hidden preferences."
arch=('any')
url="http://www.claws-mail.org/clawsker.php"
license=('GPL3')
makedepends=('gettext' 'perl' 'perl-locale-gettext' 'glib-perl' 'gtk2-perl')
source=("http://www.claws-mail.org/tools/$pkgname-$pkgver.tar.gz")
sha256sums=('133f89db736f77979603ebf02eea4fbcb654fb69cfcf2301c3598ff52ac61155')

build()
{
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make PREFIX="/usr" DESTDIR="$pkgdir" install || return 1
}
