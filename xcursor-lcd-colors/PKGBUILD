# Maintainer: flan_suse <windows2linux AT zoho DOT com>

# The LCD-Grey cursor theme is not included, because it
# is not hosted on GNOME-look.org, but rather a web site
# which is not as reliable.

# If you are interested in the LCD-Grey version, you
# can find it here, where the author uploaded it:
# http://d2.myfreefilehosting.com/d2/LCDGrey.tar.gz

pkgname=xcursor-lcd-colors
pkgver=20110130
pkgrel=1
pkgdesc="Beautifully animated glass-like cursor collection of four different colors"
arch=('any')
url="http://gnome-look.org/content/show.php/LCD+Colors?content=110545"
license=('GPL')
groups=()
depends=()
makedepends=('unrar')
source=('http://gnome-look.org/CONTENT/content-files/110545-LCDcolors.rar')
noextract=('110545-LCDcolors.rar')
md5sums=('5c13f2003724617e4ce5d29f007c3a74')

build() {
    
    # Move into source directory
    cd "${srcdir}"

    # Extract .tar.gz archives from within the .rar archive
    unrar e -y 110545-LCDcolors.rar

    # Clean up old extracted folders from ${srcdir} if they exist
    for i in LCD-*
    do
        if [ -d $i ]
        then
            rm -rf $i
        fi
    done

    # Extract all .tar.gz archives
    for i in *.tar.gz
    do
        bsdtar -xf $i
    done

    # Create installation directories
    install -d -m755 "${pkgdir}/usr/share/icons/"

    # Install the four cursor themes
    for i in LCD-*
    do
        if [ -d $i ]
        then
            cp -rf "$i" "${pkgdir}/usr/share/icons/"
        fi
    done

}


