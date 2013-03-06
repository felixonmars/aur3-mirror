# Maintainer : Anish Bhatt <anish[removethis][at]gatech[dot]edu>

pkgname=plex
_majorver=0.9.7.12
_minorver=407
_suffix=db37d6d
pkgver=${_majorver}.${_minorver}
_dver=${_majorver}.${_minorver}-${_suffix}
pkgrel=1

pkgdesc='Plex Media Server'
url='http://www.plexapp.com/linux'
arch=('i686' 'x86_64')
source=(plex-${pkgver}.rpm::http://plex.r.worldssl.net/PlexMediaServer/${_dver}/plexmediaserver-${_dver}.i386.rpm
	'plex-icon.png'
	'plex.desktop')
md5sums=('8f9df56355ae8c03b7727ef5f5f848dd'
         '50103e17fe35809ddaaec3ae315d2d35'
         '0979ec3db2a6ff39a7738d0482e64ff4')
if [[ $CARCH == x86_64 ]]; then
source[0]=plex-${pkgver}.rpm::http://plex.r.worldssl.net/PlexMediaServer/${_dver}/plexmediaserver-${_dver}.x86_64.rpm
md5sums[0]=7b0a828988bb0e9e747aa2d28143254c
fi
depends=('avahi' 'curl')
makedepends=('rpmextract')
options=(!strip)
license=('GPL')

build() {
	rpmextract.sh plex-${pkgver}.rpm
}

package() {
	install -d -m755 ${pkgdir}/usr/lib/plexmediaserver
	cp -dpr --no-preserve=ownership  usr/lib/plexmediaserver/* "${pkgdir}"/usr/lib/plexmediaserver/.
	install -d ${pkgdir}/etc/security/limits.d
	install -D -m644 ${srcdir}/etc/security/limits.d/plex.conf ${pkgdir}/etc/security/limits.d

	install -Dm644 ${srcdir}/etc/sysconfig/PlexMediaServer "${pkgdir}"/etc/conf.d/plexmediaserver
       	install -Dm644 ${srcdir}/lib/systemd/system/plex.service "${pkgdir}"/usr/lib/systemd/system/plexmediaserver.service

	install -d ${pkgdir}/usr/share/applications 
	install -D -m644 ${srcdir}/plex.desktop ${pkgdir}/usr/share/applications/ 
	install -d ${pkgdir}/usr/share/pixmaps 
	install -D -m644 plex-icon.png ${pkgdir}/usr/share/pixmaps/plex-icon.png
}


