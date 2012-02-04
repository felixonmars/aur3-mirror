# Maintainer: Erèbe - Romain Gérard <editeur.algo[at]erebe.eu>
pkgname=tabula_rasa
pkgver=0.5
pkgrel=1
pkgdesc="An editor to draw and save algorithm. Use Qt"
arch=(any)
url="https://github.com/erebe/Tabula_rasa"
license=('GPL')
depends=('qt>=4.6')
makedepends=('git')
provides=('tabula_rasa')
replaces=('tabula_rasa')
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'
_gitRoot="git://github.com/erebe/Tabula_rasa.git"
_gitName="Tabula_rasa"

build() {
        msg "Downloading source code from git repository."
        if [[ -d ${_gitName} ]]
        then
            cd ${srcdir}/${_gitName}
            git pull || return 1
        else
            git clone ${_gitRoot} || return 1
            msg "Source code successfully downloaded."

        fi
        
        cd ${srcdir}/${_gitName}
        chmod +x install.sh
        ./install.sh

      }

package() {
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/${_gitName}/tabula_rasa ${pkgdir}/usr/bin/
}
