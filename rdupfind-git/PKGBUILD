#Contributor: fooacad
#Mostly copied blatantly from emacs-haskell-mode PKGBUILD
pkgname=rdupfind-git
pkgver=20121021
pkgrel=1
_gitname="rdupfind"
_gitbranchname="rdupfind"
_gitroot="https://bitbucket.org/jyothisv/$_gitname"
pkgdesc="A fast file duplicate finder"
arch=('any')
url="https://bitbucket.org/jyothisv/$_gitname"
license=('GPL3')
depends=('python')
provides=('rdupfind')
conflicts=('rdupfind')

build() {
    mkdir -p $startdir/src

    cd $startdir/src

    if [[ -d $_gitbranchname ]]; then
        cd $_gitbranchname
        git clean -dxf
        git reset --hard
        msg "Pulling from GIT server ..."
        git pull --rebase
    else
        git clone --depth 1 $_gitroot $_gitbranchname
        cd $_gitbranchname
        git pull --rebase
    fi
}

package() {
    install -d $pkgdir/usr/bin/
    cp $startdir/src/$_gitbranchname/rdupfind.py $pkgdir/usr/bin/rdupfind
    chmod +x $pkgdir/usr/bin/rdupfind
}
