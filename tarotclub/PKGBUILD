# Maintainer: Anthony Rabine anthony.rabine@tarotclub.fr
# Contributor: 

pkgname=tarotclub
pkgver=2.5.3
pkgrel=1
_version=2.5.3
_directory="${pkgname}-${pkgname}-fae4e95d0c2e"
_hgtag=VERSION_${_version//./_}
pkgdesc="A local/network French Tarot card game."
url="http://www.tarotclub.fr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'libgl')
optdepends=()
conflicts=('tarotclub')
replaces=()
backup=()
install=()
source=('tarotclub.desktop'
	'tarotclub.sh'
	"https://bitbucket.org/tarotclub/tarotclub/get/${_hgtag}.tar.gz")

# MD5 signature of source files
md5sums=('289ae912415776f7f77f907ec64ff067'
         '4aaef27ca4b547493c879d76f24beea7'
         'SKIP')

pkgver() {
  echo ${_version}
}

build() {
    cd "${srcdir}/${_directory}"
    qmake prj/desktop.pro
    make
    qmake prj/botclient.pro
    make

}
package() {
    cd "${srcdir}/${_directory}"

    ## EXECUTABLE AND RELATED FILES ##

    install -Dm644 ./HISTORY.md "${pkgdir}"/usr/share/tarotclub/HISTORY.md
    install -Dm644 ./README.md "${pkgdir}"/usr/share/tarotclub/README.md
    install -Dm755 ./build-desktop/release/TarotClub "${pkgdir}"/usr/share/tarotclub
    install -Dm755 ./build-botclient/release/botclient "${pkgdir}"/usr/share/tarotclub
    install -Dm644 ./prj/desktop/tarotclub_fr.qm "${pkgdir}"/usr/share/tarotclub/tarotclub_fr.qm

    ## CARDS ##
    cp -r ./assets/cards/default/ "${pkgdir}"/usr/share/tarotclub/
    chmod 644 "${pkgdir}"/usr/share/tarotclub/default/*

    ## AI JAVASCRIPT FILES ##

    install -d "${pkgdir}"/usr/share/tarotclub/ai/tarotlib/
    cp -a ./assets/ai/tarotlib/{system,util,card,deck,player,bot,game}.js "${pkgdir}"/usr/share/tarotclub/ai/tarotlib/
    chmod 644 "${pkgdir}"/usr/share/tarotclub/ai/tarotlib/*
    install -Dm644 ./assets/ai/main.js "${pkgdir}"/usr/share/tarotclub/ai/main.js
    install -Dm644 ./assets/ai/package.json "${pkgdir}"/usr/share/tarotclub/ai/package.json

    ## ICONS ##
    install -Dm644 ./assets/icons/icon256x256.png "${pkgdir}"/usr/share/pixmaps/tarotclub.png
    install -Dm644 ./assets/icons/club.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/tarotclub.svg
    for res in 16 32 48 128 256 512; do
        install -Dm644 "./assets/icons/icon${res}x${res}.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/tarotclub.png"
    done

    ## DOCUMENTATION ##

    install -Dm644 ./assets/doc/index.html           "${pkgdir}"/usr/share/tarotclub/doc/index.html
    install -Dm644 ./assets/doc/rules_en.html        "${pkgdir}"/usr/share/tarotclub/doc/rules_en.html
    install -Dm644 ./assets/doc/rules_fr.html        "${pkgdir}"/usr/share/tarotclub/doc/rules_fr.html
    cp -r ./assets/doc/images/                       "${pkgdir}"/usr/share/tarotclub/doc
    chmod 644 "${pkgdir}"/usr/share/tarotclub/doc/images/*

    ## MISC FILES LOCATED AT THE PACKAGE ROOT ##
    
    cd "$srcdir/"
    install -Dm644 tarotclub.desktop "${pkgdir}"/usr/share/applications/tarotclub.desktop  
    install -Dm755 tarotclub.sh "${pkgdir}"/usr/bin/tarotclub.sh
}

