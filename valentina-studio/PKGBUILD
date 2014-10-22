# Maintainer:  Shaun Hammill <plloi.pllex@gmail.com>
# Contributor: Ben Cole <wengole@gmail.com>
# Contributor: Sam Van der Borght <sam@king-foo.be>
pkgname=valentina-studio
pkgver=5.6
pkgrel=1
pkgdesc="SQL admin for valentina DB, MySQL, Postgre and SQLite"
arch=('x86_64' 'i686')
url="https://www.valentina-db.com/en/valentina-studio-overview"
license=('custom')
options=('emptydirs')
depends=('gtk2')

if [ "$CARCH" = "i686" ]; then
	source=("http://www.valentina-db.com/download/prev_releases/$pkgver/lin_32/vstudio_5_lin.rpm")
	md5sums=('1c1f1877d41dfec51c5de4a1390ea6e0')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://www.valentina-db.com/download/prev_releases/$pkgver/lin_64/vstudio_x64_5_lin.rpm")
	md5sums=('f546c5878c89713619bdd65910ce0bf1')
fi

package() {
    msg "Installing..."
    install -d "$pkgdir"/{opt/VStudio,usr/share/licenses/valentina-studio,usr/share/applications}
    mv opt/VStudio/EULA "$pkgdir"/usr/share/licenses/valentina-studio/LICENSE
    mv opt/VStudio "$pkgdir"/opt
    mv usr/share/applications/* "$pkgdir"/usr/share/applications
    msg2 "Done!"
}

