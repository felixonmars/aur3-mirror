# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=perl-latexml-git
_pkgname=LaTeXML
pkgver=3262.68c8106
pkgrel=1
pkgdesc="LaTeX to XML converter"
arch=('i686' 'x86_64')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl' 'perl-archive-zip' 'perl-file-which' 'perl-image-size' 'perl-io-string' 'perl-json-xs' 'perl-parse-recdescent' 'perl-uri' 'imagemagick' 'perl-xml-libxml' 'perl-xml-libxslt' 'db' 'texlive-core')
options=(!emptydirs)
provides=('perl-latexml')
conflicts=('perl-latexml')
source=("git+http://github.com/brucemiller/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORBIN=/usr/bin INSTALLVENDORSCRIPT=/usr/bin TEXMF=/usr/share/texmf
  make
  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh

