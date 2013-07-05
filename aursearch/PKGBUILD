#Maintainer: nixalot <nixalot at nixalot dot com>
pkgname=aursearch
pkgver=1.0
pkgrel=1
pkgdesc="Search the AUR from the shell"
arch=(any)
license=(GPL3)
url="https://github.com/nixalot/$pkgname"
depends=('python' 'python-requests')
source=(
  ${pkgname}_${pkgver}.zip::https://github.com/nixalot/${pkgname}/archive/master.zip
)

md5sums=('609cfa03c4163a83eae3230e26a69cff')
sha1sums=('e675e77b6fc1c015d2fdcca48fa6c4d660ae7f9b')
sha512sums=('399c6633cc22e12035f5aa538903e40d0080028a7b498d32962520bb952e90d8d3931fbdf23ab77bfd3685ef4b430fdda118d25d2a5a0ef331e6e987c726334c')

package ()
{
  install -D -m755 "$srcdir/$pkgname-master/${pkgname}.py" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
