pkgbase="wikiss-en"
pkgname="wikiss-en"
pkgver=222
pkgrel=1
arch=(any)
pkgdesc="Wikiss is a simple of use and install wiki. "
url="http://wikiss.tuxfamily.org/?page=Accueil"
license=(GPLv2)
depends=("php")
provides=("wikiss")
lang=EN
source=("http://download.tuxfamily.org/wikiss/TigerWiki/tigerwiki_${pkgver}_${lang}.zip")
md5sums=("3b4fa1a4b52e46408af140243c08d71b")

build() {
    cp wiki/_config.php wiki/config.php
    echo "By default, wikiss will be installed in /var/www/wiki." 
    echo "You should edit PKGBUILD to chose another location."
    echo -n "Would you like to edit your configuration file right now? [Y/n] "
    read -n 1 response
    if [ "$response" == "n" ] || [ "$response" == "N" ]
    then
        echo "Very well. Edit /var/www/wiki/config.php later. "
    else
        $EDITOR wiki/config.php 
    fi
}

package() {
    mkdir -p $pkgdir/var/www
    mv wiki $pkgdir/var/www
}
