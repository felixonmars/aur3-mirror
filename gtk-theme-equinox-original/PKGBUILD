# Maintainer: flan_suse <windows2linux AT zoho DOT com>

# Tiheum, creator of the Equinox GTK engine and themes,
# as well as the Faenza icon pack, has discontinued support
# for the original Equinox themes. This includes Equinox,
# Equinox Light, and Equinox Glass.

# While no longer maintained, these are fully useable and
# matured GTK themes. 

pkgname=gtk-theme-equinox-original
pkgver=1.30
pkgrel=1
_pkgname=equinox-themes
pkgdesc="Original Equinox theme pack, including the popular Glass theme"
url="http://gnome-look.org/content/show.php?content=140448"
license=('GPL2')
arch=('any')
depends=('gtk-engine-equinox')
optdepends=('faenza-icon-theme: icons designed for this theme')
source=("http://gnome-look.org/CONTENT/content-files/140448-$_pkgname-$pkgver.tar.gz")
md5sums=('4393359366065e9f680215bbac986988')

package() {

    # Move into source directory
    cd "${srcdir}"

    # Remove Evolution themes
    # Evolution is the new official theme pack
    rm -rf *Evolution*
    rm -rf userChrome.css

    # Create installation directories
    install -d -m755 "${pkgdir}/usr/share/themes/"

    # Install the themes
    mv Equinox* "${pkgdir}/usr/share/themes/"

}
