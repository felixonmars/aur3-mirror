# Maintainer: Judd Vinet <jvinet@gmail.com>

pkgname=packrat-git
_gitname=packrat
pkgver=2014.04.15.ge1ac261
pkgrel=1
pkgdesc="A simple backup system with included modules for SSH, Amazon S3, and MySQL"
arch=(any)
url="https://github.com/jvinet/packrat"
license=('MIT')
depends=('dar' 'bash')
conflicts=('packrat')
backup=('etc/packrat.conf')
optdepends=('aws: for use with S3 as offsite backup storage')
makedepends=('git')
source=("git://github.com/jvinet/packrat.git" "COPYING")
md5sums=('SKIP' 'f80cffeaf1a38d768b8c2ef87dc5c5d6')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  install -dm755 "$pkgdir/usr/share/packrat/modules"
  install -cm644 modules/*.sh "$pkgdir/usr/share/packrat/modules"
  install -Dm755 packrat "$pkgdir/usr/bin/packrat"
  install -Dm600 packrat.conf "$pkgdir/etc/packrat.conf"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/packrat/COPYING"
}
