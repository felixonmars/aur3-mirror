# Maintainer: Sebastian Weiland <sebastianweiland97@gmail.com>

pkgname=gnome-yosemite-icons-git
pkgver=1
pkgrel=4
pkgdesc="Icon theme to match Mac OSX 10.10 Yosemite"
makedepends=("git")
arch=("any")
url="https://github.com/zacpier/GnomeYosemiteIcons"
depends=("numix-circle-icon-theme")
provides=("gnome-yosemite-icons")
license=('MIT')

package() {	
sudo sh -c "curl https://raw.githubusercontent.com/Foggalong/hardcode-fixer/master/fix.sh | bash"

curl https://raw.githubusercontent.com/zacpier/GnomeYosemiteIcons/master/download_from_github.sh | sh
}
