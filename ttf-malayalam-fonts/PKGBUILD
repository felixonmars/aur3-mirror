# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in

pkgname=ttf-malayalam-fonts
# This variable had to be introduced to deal with the peculiar naming scheme and 
# the directory structure of the source when extracted folder
pkgver="6.0"
pkgrel=0
pkgdesc=" This is a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=('i686' 'x86_64')
url="http://smc.org.in/"
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings')
install=ttf-malayalam-fonts.install
source=(http://download.savannah.gnu.org/releases-noredirect/smc/fonts/malayalam-fonts-${pkgver}.tar.xz)
md5sums=('d80ffa4fb3796f69267347833096c081')


build() {
  cd "${srcdir}/fonts" || return 1
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  for f in `ls ./*/*.ttf`
  do
    install -m644 $f "${pkgdir}/usr/share/fonts/TTF" 
  done
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
