
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>
_perlmod=vmware-vsphere-sdk
pkgname=perl-$_perlmod
pkgver=5.1.0.780721
pkgrel=1
pkgdesc="The vSphere SDK for Perl provides an easy-to-use Perl scripting interface to the vSphere API. Administrators and developers can work with vSphere API objects using vSphere SDK for Perl subroutines"
arch=()
url="http://www.vmware.com/support/developer/viperltoolkit/"
license=()
groups=()
depends=('perl>=5.10.0' 'perl-archive-zip>=1.28' 'perl-crypt-ssleay>=0.55' 'perl-io-compress>=2.037' 'perl-class-methodmaker>=2.10' 'perl-soap-lite>=0.710.08' 'perl-uri' 'perl-xml-sax' 'perl-xml-namespacesupport' 'perl-xml-libxml' 'perl-lwp-protocol-https')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
arch=('x86_64')
source=(VMware-vSphere-Perl-SDK-5.1.0-780721.x86_64.tar.gz)
md5sums=('d3d88a3016d0bc04324b8d270fb8821e')

build() {
  cd "$srcdir/vmware-vsphere-cli-distrib"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/vmware-vsphere-cli-distrib"
  make install DESTDIR="$pkgdir/" DEST_VMWARE_APPS="$pkgdir/usr/lib/vmware-viperl/apps" DEST_VMWARE_DOC="$pkgdir/usr/share/doc/vmware-viperl/doc"

}

# vim:set ts=2 sw=2 et:
