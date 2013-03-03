# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: RobbeR49 <robertsna@gmail.com>

pkgname=gmusicbrowser-devel
realname=gmusicbrowser
pkgver=1.1.10
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac/mpc files, written in perl. With additional icon themes from shimmerproject."
arch=('any')
url="http://gmusicbrowser.org/devel.html"
license=('GPL3')
depends=('gtk2-perl')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'perl-gstreamer: enables the gstreamer backend'
            'gstreamer0.10-base: vorbis supportfor the gstreamer backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer backend'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-locale-gettext: localization support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gnome2-wnck: titlebar plugin support'
            'perl-html-parser: support for accented characters in lyrics plugin')
provides=('gmusicbrowser') 
conflicts=('gmusicbrowser' 'gmusicbrowser-development' 'gmusicbrowser-git' 'gmusicbrowser-shimmer-git')
source=("http://gmusicbrowser.org/download/gmusicbrowser-${pkgver}.tar.gz"
        "http://dl.dropbox.com/u/4776753/gmusicbrowser-shimmerproject.tar.gz")
md5sums=('4387b5352bb872a067128e3b38d453e2'
         '24a5a6c66e8ace78b2575a1280fcf50d')
sha256sums=('7239ac6ad6bb308d5aab7aeab02f1ce1444591e537e647b87ddbabfedde58361'
            '106d77b1ca2da0b0eff49d0dd0badc5b173132397b6f980e7af6c2591fd9127c')

build() {
    cd "${srcdir}"/${realname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 et:
