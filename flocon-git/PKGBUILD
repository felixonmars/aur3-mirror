# Maintainer: Franck Michea <franck.michea@gmail.com>
# Maintainer: Yannick LM <yannicklm1337@gmail.com>
pkgname=flocon-git
pkgver=20121124
pkgrel=1
pkgdesc="Archlinux packages shared on local network"
arch=('any')
url="http://bitbucket.org/kushou/flocon"
license=('BSD')
groups=()
depends=('python2' 'twisted')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=()
noextract=()
md5sums=()

_gitroot='https://bitbucket.org/kushou/flocon.git'
_gitname='flocon'

build() {
    if [ -d "$_gitname" ]; then
        cd "$_gitname"
        git checkout master
        git pull --rebase
    else
        git clone "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi

    python2 setup.py build
}

package() {
    cd "$_gitname"

    # Python package
    python2 setup.py install --root=$pkgdir/ --optimize=1

    # License
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Systemd unit file.
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install lib/flocon-git.service $pkgdir/usr/lib/systemd/system/flocon-git.service
}
