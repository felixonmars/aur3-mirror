# Contributor: Christian Hesse <mail@earthworm.de

pkgname=ldif2vcard
pkgver=20100605
pkgrel=3
pkgdesc="Convert ldif to vcard -- CVS checkout"
arch=('any')
url="http://ldiv2vcard.sourceforge.net/"
license=('GPL')
depends=('perl' 'perl-mime-base64' 'perl-ldap')
makedepends=('cvs')

_cvsroot=":pserver:anonymous:@ldif2vcard.cvs.sourceforge.net:/cvsroot/ldif2vcard"
_cvsmod="ldif2vcard"

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

  mkdir -p $pkgdir/usr/bin/
  install -m 755 src/ldif2vcard.pl $pkgdir/usr/bin/ldif2vcard
}
