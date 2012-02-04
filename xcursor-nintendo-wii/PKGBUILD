# Maintainer: flan_suse <windows2linux AT zoho DOT com>
pkgname=xcursor-nintendo-wii
pkgver=0.3.1
pkgrel=2
pkgdesc="Nintendo Wii controller cursor theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Wii+Cursors?content=100367"
license=('CCPL')
groups=()
depends=()
source=('http://gnome-look.org/CONTENT/content-files/100367-WiiCursors-0.3.1.tar.bz2')
md5sums=('3fa928f448f974bc1bea15e30777bca6')

build() {
    
    # Move into source directory
    cd "${srcdir}"

    # Fix the file and folder permissions
    for i in *CursorTheme
    do
        if [ -d $i ]
        then
            find "$i" -type d -exec chmod 755 '{}' \;
            find "$i" -type f -exec chmod 644 '{}' \;
        fi
    done

    # Create installation directories
    install -d -m755 "${pkgdir}/usr/share/icons/"

    # Install the cursor theme
    for i in *CursorTheme
    do
        if [ -d $i ]
        then
            cp -rf "$i" "${pkgdir}/usr/share/icons/"
        fi
    done

}


