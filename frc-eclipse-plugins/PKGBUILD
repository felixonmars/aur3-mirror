#Maintainer: Alex Brinister (alex_brinister@yahoo.com)
pkgname=frc-eclipse-plugins
pkgver=1.0
pkgrel=1
pkgdesc="Plugins to allow users to build FRC C++ projects in Eclipse"
arch=(any)
provides=('frc-eclipse-plugins')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
depends=('frc-aliases-hg')
options=('!strip' 'libtool' '!zipman')
_zip_name_aliases="frc-aliases-1.0.0"
_zip_name_runner="frc-runner-1.0.0"
source=(https://www.dropbox.com/s/yx1orzkqf6vmbg8/"$_zip_name_aliases".zip
		https://www.dropbox.com/s/xucfee0c0aoq7ex/"$_zip_name_runner".zip)
sha512sums=('6606d89af996dae4e86c6c6697f254c8b873ec1a2a1d2216107285c20499fe288926a45b3280eef66db7063b0ac6f8ac92abf5b5270ff5a4fc305887773b5ec5'
            '478abf10660894dae7e5c4f1be705c5fcc99120aacb74b3c24c30e22b1216bd3d8c5b32ebae5d23ab3f4b0dc85614a74a1d68d316a5380aeab7d8919fa596cf7')
noextract=("'$_zip_name_aliases'.zip" "'$_zip_name_runner'.zip")

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/eclipse/dropins/frc-aliases
  mkdir -p $pkgdir/usr/share/eclipse/dropins/frc-runner
  unzip "$_zip_name_aliases" -d $pkgdir/usr/share/eclipse/dropins/frc-aliases
  unzip "$_zip_name_runner" -d $pkgdir/usr/share/eclipse/dropins/frc-runner
}

