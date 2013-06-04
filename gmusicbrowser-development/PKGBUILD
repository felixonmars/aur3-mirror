# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=gmusicbrowser-development
pkgver=1.1.10
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac/mpc files, written in perl."
arch=('any')
url="http://gmusicbrowser.org/devel.html"
license=('GPL3')
depends=('gtk2-perl' 'perl-locale-gettext' 'perl-gstreamer-interfaces' 'perl-gnome2-wnck' 
         'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-ugly-plugins' 
         'gstreamer0.10-bad-plugins' 'alsa-utils' 'mplayer' 'flac123' 'mpg123' 'vorbis-tools' 
         'perl-net-dbus' 'perl-gtk2-notify' 'perl-gtk2-webkit') 
conflicts=('gmusicbrowser' 'gmusicbrowser-git')
source=(http://gmusicbrowser.org/download/gmusicbrowser-${pkgver}.tar.gz)
md5sums=('4387b5352bb872a067128e3b38d453e2')
sha256sums=('7239ac6ad6bb308d5aab7aeab02f1ce1444591e537e647b87ddbabfedde58361')

package() {
    cd ${srcdir}/gmusicbrowser-${pkgver}
    make DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 et:
