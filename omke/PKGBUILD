# Contributor: Todd Partridge (Gen2ly) toddrpartridge (at) gmail

pkgname=omke
pkgver=1.0
pkgrel=1
pkgdesc="A program to enable/disable features on some HP laptops"
arch=('any')
url="https://sourceforge.net/projects/omke/files/"
license=('GPL')
depends=('omnibook-svn')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ce5065abff270688e1e9ee5a74b03b93')


build() {

  # Make pkgbuild directories
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/docs/omke

  # Install files
  cd "$srcdir/$pkgname"
  install -m755 omke.pl $pkgdir/usr/bin/omke
  install -m644 README $pkgdir/usr/share/docs/omke

}
