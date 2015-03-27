# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=telegram-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Official desktop version of Telegram messaging app."
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL v3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
# optdepends=('libappindicator-gtk3: Allow applications to export a menu into the Unity Menu bar' 
#             'libappindicator-gtk2: Allow applications to export a menu into the Unity Menu bar')
# makedepends=('')
# conflicts=('')
# provides=('')
# replaces=('')
install="$pkgname.install"

if [[ $CARCH == "x86_64" ]]; then
    sha1sums=('ba940a52831fd2e64aea5c68c18af5d8a1ecf3b1' '4a03f92dff1ae383c12a5dc6e833f9ddb9b9b71a')
    source=("$pkgname.tar.xz"::'https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.tar.xz' 'telegram')
    
elif [[ $CARCH == "i686" ]]; then
    sha1sums=('0e20d6ebe76e637ca3d780f6465911997b060be3' '4a03f92dff1ae383c12a5dc6e833f9ddb9b9b71a')
    source=("$pkgname.tar.xz"::'https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.tar.xz' 'telegram')
fi


# prepare() {

#    cd "$srcdir"
   
    # fix
#    patch -p0 -i "$srcdir/fix.patch"

# }


package() {

    cd "$srcdir/"
    
    msg2 "  -> Extracting files..."
    tar Jxvf  $pkgname.tar.xz -C .
    
    msg2 "  -> Installing program..."
    # install -d $pkgdir/{opt/telegram,usr/bin,usr/share}
    install -dm755 "$pkgdir/opt/telegram/"
    install -dm755 "$pkgdir/usr/bin"
    # install -dm755 "$pkgdir/usr/share"

    # Program
    echo "$pkgdir/opt/telegram/"
    # cp -r "$srcdir/Telegram/"* "$pkgdir/opt/telegram/"
    install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/opt/telegram/"
    # install -Dm644 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"
    install -Dm755 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"
    
    # Link to program
    # ln -s "/opt/telegram/Telegram" "$pkgdir/usr/bin/telegram"
    cp -u "$srcdir/telegram" "$pkgdir/usr/bin/"

    # Icon
    # msg2 "  -> Installing icons..."
    # install -Dm644 "$srcdir/telegram.svg" "$pkgdir/usr/share/pixmaps/telegram.svg"
    # ~/.TelegramDesktop/tdata/icon.png


    # Desktop file
    # msg2 "  -> Installing .desktop file..." 
    # install -Dm644 "$srcdir/telegram.desktop" "$pkgdir/usr/share/applications/telegram.desktop"
    # ~/.local/share/applications/telegramdesktop.desktop

}