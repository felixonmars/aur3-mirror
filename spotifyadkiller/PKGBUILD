# Maintainer: Preston Carpenter <APragmaticPlace@gmail.com>
pkgname=spotifyadkiller
pkgver=1
pkgrel=1
epoch=0
pkgdesc="Your Party with Spotify - but without ads!"
arch=('any')
url="https://github.com/SecUpwN/Spotify-AdKiller"
license=('GPL3')
groups=()
depends=("xorg-xprop" "libpulse" "libnotify")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SecUpwN/Spotify-AdKiller/archive/master.tar.gz")
noextract=()
md5sums=("2647970662b47a51a7f835acdf75f77c")
validpgpkeys=()

prepare() {
    # This is where the script checks for a spotify executable
    mkdir -p $HOME/bin
    git clone "https://github.com/SecUpwN/Spotify-AdKiller"
}

package() {
	cd "$pkgname"
    install -Dm755 "$srcdir"/"$pkgname"/spotify-adkiller.sh $HOME/bin/spotify-adkiller.sh
    install -Dm755 "$srcdir"/"$pkgname"/spotify-wrapper.sh $HOME/bin/spotify-wrapper.sh
	#./install.sh
}
