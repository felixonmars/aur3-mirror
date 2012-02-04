# Contributor: Sergey Dovgal <arcadoss@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-sgml-dtd'
pkgver='0.02'
pkgrel='1'
pkgdesc="perl SGML DTD parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/perl'
source=('http://search.cpan.org/CPAN/authors/id/E/EH/EHOOD/perlSGML.1997Sep18.tar.gz')
md5sums=('22b7022bb6f13ea5a58d2dc4a0a3aaa9')
sha512sums=('80d3b7762524a54c86e57a08ebda52c72a0619acf3b23750d05424903f554e1aefc7ba799e099fce150e772c01ee0455e5fda168ca21a285cb13c58b292a4532')

_distdir="${srcdir}/perlSGML.1997Sep18"

package() {
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man" "${pkgdir}/usr/share/perl5/site_perl/"

  cd "$_distdir"
  /usr/bin/perl install.me                             \
    -binpath "${pkgdir}/usr/bin"                       \
    -batch                                             \
    -libpath  "${pkgdir}/usr/share/perl5/site_perl/"   \
    -manpath  "${pkgdir}/usr/share/man"                \
    -nodoc                                             \
    -perlpath /usr/bin/perl
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
