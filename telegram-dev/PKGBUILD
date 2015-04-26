# Maintainer:  Michael Moroni <michael.moroni@openmailbox.org>
# Original PKGBUILD: jfperini <@jfperini>

pkgname=telegram-dev
pkgver=0.8.6
pkgrel=1
pkgdesc="Development desktop version of Telegram messaging app."
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
optdepends=('libappindicator-gtk3: Allow applications to export a menu into the Unity Menu bar' 
	    'libappindicator-gtk2: Allow applications to export a menu into the Unity Menu bar')
# makedepends=('')
conflicts=('telegram-bin')
# provides=('')
# replaces=('')
install="$pkgname.install"

if [[ $CARCH == "x86_64" ]]; then
    sha1sums=('df5f125833e62e3c4d1a062d7b71792180d071f4'
          '4a03f92dff1ae383c12a5dc6e833f9ddb9b9b71a')
    source=("$pkgname.tar.xz"::'https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.dev.tar.xz' 'telegram')
    
elif [[ $CARCH == "i686" ]]; then
    sha1sums=('6781d581f2f64cc5ae698b60e88269cdc57d8d10'
          '4a03f92dff1ae383c12a5dc6e833f9ddb9b9b71a')
    source=("$pkgname.tar.xz"::'https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.dev.tar.xz' 'telegram')
fi

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
