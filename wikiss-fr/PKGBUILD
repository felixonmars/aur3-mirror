pkgbase="wikiss-fr"
pkgname="wikiss-fr"
pkgver=222
pkgrel=1
arch=(any)
pkgdesc="Wikiss est un wiki simple à déployer et à utiliser. "
url="http://wikiss.tuxfamily.org/?page=Accueil"
license=(GPLv2)
depends=("php")
provides=("wikiss")
source=("http://download.tuxfamily.org/wikiss/TigerWiki/tigerwiki_${pkgver}_FR.zip")
md5sums=("64664d85fccc74484d9f4f832eaff46c")

build() {
    cp wiki/_config.php wiki/config.php
    echo "Par défaut, wikiss sera installé dans /var/www/wiki." 
    echo "Vous devez éditer PKGBUILD pour choisir un autre emplacement."
    echo -n "Voullez vous éditer le fichier de configuration dès maintenant? [O/n] "
    read -n 1 response
    if [ "$response" == "n" ] || [ "$response" == "N" ]
    then
        echo "Très bien. Editez le fichier /var/www/wiki/config.php plus tard. "
    else
        $EDITOR wiki/config.php 
    fi
}

package() {
    mkdir -p $pkgdir/var/www
    mv wiki $pkgdir/var/www
}
