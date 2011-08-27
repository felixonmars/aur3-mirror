# Contributor: AUR Perl <aurperl@juster.us>

pkgname=perldocs
pkgver=5.12.2
pkgrel=1
pkgdesc="Core documentation for perl 5.12.2 in HTML format."
arch=(any)
url='http://perldoc.perl.org'
license=(PerlArtistic GPL)
depends=()
options=(docs !zipman !strip) # avoid options that don't apply
source=('http://perldoc.perl.org/perldoc-html.tar.gz')
md5sums=('46bfb048354717ef4a19eeba483e0d51')

build()
{
  install -m755 -d "${pkgdir}/usr/share/doc"
  cp -r "${srcdir}/perldoc-html-${pkgver}" "${pkgdir}/usr/share/doc/perl"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
