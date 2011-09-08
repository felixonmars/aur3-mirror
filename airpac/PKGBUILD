# Contributor: Darwin M. Bautista <djclue917@gmail.com>

pkgname=airpac
pkgver=0.1.2
pkgrel=2
pkgdesc="aria2c wrapper for pacman"
arch=('any')
url="http://www.darwin.uk.to"
license=('GPL')
depends=('aria2>=1.3.0' 'python>=2.6.0')
backup=('etc/airpac.conf')
install=$pkgname.install
source=(setup.py airpac airpac.py airpac.conf)
md5sums=('549aeb86e9ee5c24706b63afcc08f882'
         '095b4926670bc2cb9c16e0fe0349ae05'
         'ec9f18226bd2d111da8bbddb5ec753ce'
         'bdd6f749670605e621857bd97a4530c0')

build() {
  python2 setup.py install --optimize 1 --root=${pkgdir}/
}

# vim:set ts=2 sw=2 et:
