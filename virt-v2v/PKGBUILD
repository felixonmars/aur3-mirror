# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=virt-v2v
pkgver=0.9.1
pkgrel=5
pkgdesc="Convert a guest to use KVM (support esx, virtualbox, kvm, xen)"
arch=(i686 x86_64)
license=('GPL2')
url="https://git.fedorahosted.org/"
depends=('libguestfs' 'hivex' 'perl-libintl-perl' 'perl-module-pluggable' 'perl-module-find' 'perl-xml-dom' 'perl-xml-dom-xpath' 'perl-xml-xpathengine>=0.14' 'perl-sys-virt>=1.0.5' 'perl-term-progressbar' 'perl-datetime' 'perl-net-ssleay' 'perl-crypt-ssleay' 'perl-archive-extract' 'perl-yaml-tiny' 'perl-digest-sha1')
#install perl-archive-extract from aur !

backup=()
conflicts=()
provides=()
replaces=()
source=(https://git.fedorahosted.org/cgit/virt-v2v.git/snapshot/virt-v2v-${pkgver}.tar.gz)

options=(!strip)

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autobuild.sh || return 0
}
package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p ${pkgdir}/usr/share/perl5/site_perl/
    cp -rp blib/lib/Sys ${pkgdir}/usr/share/perl5/site_perl/
    mkdir -p ${pkgdir}/usr/bin
    cp -rp blib/script/* ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/var/lib/virt-v2v
    cp v2v/virt-v2v.db ${pkgdir}/var/lib/virt-v2v/virt-v2v.db
    mkdir -p ${pkgdir}/etc
    cp v2v/virt-v2v.conf ${pkgdir}/etc/virt-v2v.conf
}
md5sums=('877134fd3c73bce855ace24e65cb37b1')
