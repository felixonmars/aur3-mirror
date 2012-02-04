# Maintainer: Patrick Mullaney  <pajmullaney@gmail.com>
# PKGBUILD modified from t3ddy's google-chrome PKGBUILD
# PKGBUILD updated by Matej Lach <matej.lach@gmail.com>

pkgname=google-musicmanager-current
pkgver=1.0.0  
pkgrel=1
pkgdesc="A simple application for adding the music files on your computer to your Music library."
arch=('i686' 'x86_64')
url="http://music.google.com"
license=('custom:musicmanager')
depends=('flac' 'qt' 'fontconfig' 'libogg' 'freetype2' 'libvorbis' 'xdg-utils' 'libidn')
install=${pkgname}.install

if [ "$CARCH" = "i686" ]; then
    options=(!strip)
    _arch='i386'    
    md5sums=('412ed6fad2c7b0971f801ea2a8cdefb0')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    md5sums=('1bce82a86ee96581899388fc27027c05')
fi

source=("http://dl.google.com/linux/direct/google-musicmanager-beta_current_${_arch}.deb")


package() {
    msg "Extracting the Google MusicManager package"
    ar -xv google-musicmanager-beta_current_${_arch}.deb
    tar -xvf data.tar.lzma

    msg "Preparing for installation"
    install -d "$pkgdir"/{opt,usr/{bin,share/applications}}
    mv -v opt/google "$pkgdir"/opt

    msg "Installing"
    ln -sv /opt/google/musicmanager/google-musicmanager "$pkgdir/usr/bin/"
    mv -v "$pkgdir/opt/google/musicmanager/google-musicmanager.desktop" "$pkgdir/usr/share/applications"

    # Installing icons to /usr/share/icons/hicolor/
    for i in 16 32 48 128;
    do
        install -D "$pkgdir/opt/google/musicmanager/product_logo_${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/google-musicmanager.png"
    done
        
    msg2 "Installation was successful. Enjoy!"
}
