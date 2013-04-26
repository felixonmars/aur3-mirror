# Maintainer: Martin Stolpe <martin (dot) stolpe [at] gmail (dot) com>
pkgname=perl-xmltwig-git
_gitname=xmltwig
pkgver=a21bcd3
pkgrel=1
pkgdesc="A perl module for processing huge XML documents in tree mode."
arch=('any')
url=https://github.com/mirod/${_gitname}
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('git')
source=("${_gitname}::git://github.com/mirod/${_gitname}.git")
options=(!emptydirs)
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make install DESTDIR="$pkgdir/"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
