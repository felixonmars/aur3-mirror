# $Id: PKGBUILD 48930 2011-06-07 18:55:04Z angvp $ 
# Maintainer: Angel Velasquez <angvp@archlinux.org> 
pkgname="python-sqlalchemy-doc"
pkgver=0.9.6
pkgdesc="Python SQL toolkit and Object Relational Mapper"
pkgrel=1
arch=('any')
url="http://www.sqlalchemy.org/"
license=('MIT')
makedepends=('python-sphinx' 'python-mako' 'python-sphinx-paramlinks')
source=("http://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
sha256sums=(0a9ad46f32df2ba87d3092b89e4c760c796ad481b21544485eb97cb8ca321b6b)

build() {
  cd "${srcdir}/SQLAlchemy-${pkgver}"
  python setup.py build_sphinx
}

package() {
  cd "${srcdir}/SQLAlchemy-${pkgver}"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  while read -d ''; do
    install -Dm644 "$REPLY" "$pkgdir/usr/share/doc/$pkgname/${REPLY#build/sphinx/html/}"
  done < <(find doc/build/output/html -type f -print0)
}
