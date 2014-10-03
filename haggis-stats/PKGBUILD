# Maintainer: Karl Nicoll <karl@karlnicoll.net>

pkgname=haggis-stats
pkgver=2.2.1
pkgrel=1
pkgdesc="A Lightweight script that prints system stats in an easy-to-read format, and provides screenshot capabilities."
arch=(any)
depends=('coreutils' 'perl' 'perl-switch')
license=('BSD')
source=(
	${pkgname}-${pkgver}.deb::http://www.haggistech.co.uk/stats/${pkgname}_${pkgver}_all.deb
)
url=('http://www.neowin.net/forum/topic/1179351-linux-system-stats-script-next-generation/')
sha256sums=('7bbd1e6c66333d3dccadff7f7abdf6ac0b500c9f2bf5f14a4892c4a84f2b34d7')

package() {
	pushd "${srcdir}" > /dev/null || return 1
    
        # Unpack the .deb file.
        ar x "${pkgname}-${pkgver}.deb" > /dev/null || return 1
        tar -xJpf data.tar.xz || return 1
    
		# Install binary files.
		install -D -m755 "usr/bin/haggis-stats"             "${pkgdir}/usr/bin/haggis-stats" || return 1
        
        # Install man files.
        install -D -m644 "usr/man/man1/haggis-stats.1.gz"   "${pkgdir}/usr/share/man/man1/haggis-stats.1.gz" || return 1
        
        # Extract and install other documentation.
        pushd "usr/share/doc/haggis-stats" > /dev/null || return 1
            gunzip "changelog.gz" || return 1
            gunzip "NEWS.gz" || return 1
            
            install -D -m644 "changelog"  "${pkgdir}/usr/share/doc/haggis-stats/ChangeLog" || return 1
            install -D -m644 "copyright"  "${pkgdir}/usr/share/doc/haggis-stats/COPYING" || return 1
            install -D -m644 "NEWS"       "${pkgdir}/usr/share/doc/haggis-stats/NEWS" || return 1
            install -D -m644 "README"     "${pkgdir}/usr/share/doc/haggis-stats/README" || return 1
        popd > /dev/null
	popd > /dev/null
}
