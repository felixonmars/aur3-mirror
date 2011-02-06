# Maintainer: Stefano Pompa <stefano.pompa@ge.com>
# Contributor:

pkgname=xmltv-cvs
pkgver=20101020
pkgrel=1
pkgdesc="Set of utilities to download tv listings and format them in xml - cvs version"
arch=('any')
url="http://xmltv.cvs.sourceforge.net/"
license=('GPL')
depends=('perl-archive-zip' 'perl-date-manip' 'perl-file-slurp'
         'perl-http-cache-transparent' 'perl-http-response-encoding' 
         'perl-html-tree' 'perl-io-stringy' 'perl-lingua-en-numbers-ordinate' 
         'perl-lingua-preferred' 'perl-soap-lite' 'perl-term-progressbar'
         'perl-term-readkey' 'perl-timedate' 'perl-tk-tablematrix' 
         'perl-unicode-string' 'perl-unicode-utf8simple' 'perl-www-mechanize'
         'perl-xml-dom' 'perl-xml-libxml' 'perl-xml-libxslt' 'perl-xml-simple'
         'perl-xml-twig' 'perl-xml-writer')
makedepends=('cvs')
provides=('xmltv')
conflicts=('xmltv')
source=()
md5sums=('')

_cvsroot=":pserver:anonymous@xmltv.cvs.sourceforge.net:/cvsroot/xmltv"
_cvsmod="xmltv"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  #
  # BUILD HERE
  #
  yes | perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor 

  make
}
package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR=${pkgdir} PREFIX=/usr install
	 
  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
