# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=perl-config-file-svn
pkgver=77911
pkgrel=1
pkgdesc="Config::File"
arch=('any')
url="http://packages.qa.debian.org/libc/libconfig-file-perl.html"
license=('GPL2')
makedepends=('perl>=5.10.0')
options=(!emptydirs)
_svnmod=libconfig-file-perl
_svntrunk=svn://svn.debian.org/pkg-perl/trunk/$_svnmod/
_svnrev=77911

build() {
  cd "$srcdir"
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$_svnrev")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$_svnrev" "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"

  cd "$_svnmod"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$_svnmod"

  perl Build install

  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
  
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
