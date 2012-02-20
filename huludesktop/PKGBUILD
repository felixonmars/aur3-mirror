# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=huludesktop
pkgver=0.9.8
pkgrel=5
pkgdesc="Official Hulu Desktop client for Linux. You may need to edit ~/.huludesktop to the correct path of your Flash plugin."
arch=(i686 x86_64)
url="http://www.hulu.com/labs/hulu-desktop-linux"
license=('custom')
groups=('multimedia')
depends=('flashplugin' 'gtk2' 'glib2')
optdepends=('lirc: for remote control functionality')

if [ `uname -m` = "x86_64" ]; then   # On 64 bit machines
    md5sums=('bccc94d7f327989dab2653d254f40869')
    _debsrc=huludesktop_amd64.deb
else   # On 32 bit machines
    md5sums=('d9b27d1837ab86526100964e80c3cdd1')
    _debsrc=huludesktop_i386.deb
fi
source=(http://download.hulu.com/$_debsrc)
noextract=($_debsrc)


build() {
    # Config variables
    local hulubin=$pkgdir/usr/bin/huludesktop
    local flashplugin=/usr/lib/mozilla/plugins/libflashplayer.so
    # End config variables

    cd $srcdir

    ar p $_debsrc data.tar.gz | (cd $pkgdir; bsdtar xf -)

    # Fix menu entry
    # sed -i 's/Categories=GTK;AudioVideo;Audio;Video;Player;TV;/Categories=GNOME;Application;Network;/' $pkgdir/usr/share/applications/huludesktop.desktop

    # Create a huludesktop.ini if necessary on first startup
    mv $hulubin $hulubin-bin
    cat <<EOF >>$hulubin
#!/bin/bash

[ -f ~/.huludesktop ] || cat <<! >~/.huludesktop
[flash]
flash_location = $flashplugin

; To bypass first-run EULA, uncomment:
;[version]
;eula_version = 1
!

exec huludesktop-bin
EOF
    chmod 755 $hulubin
}
