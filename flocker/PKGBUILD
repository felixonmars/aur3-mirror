# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <Azul Inho>
pkgname=flocker
pkgver=0.4.0
pkgrel=3
pkgdesc="Easily manage Docker containers & their data"
arch=('any')
url="https://github.com/ClusterHQ/flocker"
epoch=""
license=('Apache')
groups=()
depends=('python2' 'python2-virtualenv')
makedepends=()
checkdepends=()
optdepends=()
provides=('flocker')
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

package () {
    test -e $pkgdir/usr/bin || mkdir -p $pkgdir/usr/bin
    test -e $pkgdir/opt || mkdir -p $pkgdir/opt/

    for ta in flocker flocker-changestate flocker-control flocker-dataset-agent \
               flocker-deploy flocker-reportstate flocker-volume flocker-zfs-agent
    do
        echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$ta
        echo 'export PATH="${PATH}:+${PATH}":/opt/flocker/bin'  >> $pkgdir/usr/bin/$ta
        echo "/opt/flocker/bin/$ta \$*" >> $pkgdir/usr/bin/$ta
        chmod 755 $pkgdir/usr/bin/$ta
    done

    virtualenv2 --no-site-packages $pkgdir/opt/flocker
    source $pkgdir/opt/flocker/bin/activate
    $pkgdir/opt/flocker/bin/pip install --upgrade pip
    $pkgdir/opt/flocker/bin/pip install --quiet https://storage.googleapis.com/archive.clusterhq.com/downloads/flocker/Flocker-0.4.0-py2-none-any.whl

    wget -o $pkgdir/opt/flocker/LICENSE -c https://raw.githubusercontent.com/ClusterHQ/flocker/master/LICENSE
}
