# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

_name=warcarrier
pkgname="${_name}-svn"
pkgver=56  
pkgrel=2
pkgdesc='An ncurses-based, all-in-one instrument panel for professional wardriving.'
url='https://code.google.com/p/warcarrier/'
arch=('any')
license=('GPL')
makedepends=('subversion')
depends=('ncurses' 'perl' 'perl-json-xs' 'gpsd' 'bluez' 'bluez-utils'
         'aircrack-ng' 'spectools' 'perl-net-bluetooth' 'perl-curses-ui')
install="${_name}.install"
source=("${_name}::svn+http://warcarrier.googlecode.com/svn/trunk/"
        "${_name}.sh")
sha256sums=('SKIP'
            '233fb9a99b251e6d4df784f1b19f294d6eff5df464adf02e43c419a9f5a7c2c3')

pkgver() {
   cd "${srcdir}/${_name}"
   local ver="$(svnversion)"
   printf "%s" "${ver//[[:alpha:]]}"
}

package() {
   cd "${srcdir}/${_name}"
   install -d "${pkgdir}/opt/${_name}"/{includes/{html{,/style},sound},lib,logs/{capfiles,html,txt}}
   install -m644 -t "${pkgdir}/opt/${_name}"/includes/html/style includes/html/style/*
   install -m644 -t "${pkgdir}/opt/${_name}"/includes/html/ includes/html/*.html
   install -m644 -t "${pkgdir}/opt/${_name}"/includes/sound/ includes/sound/*
   install -m644 -t "${pkgdir}/opt/${_name}"/lib/ lib/*
   install -m755 -t "${pkgdir}/opt/${_name}"/ warcarrier wcclean wcd uber2th
   install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}
