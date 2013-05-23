# Maintainer: Francesco Marella <francesco.marella@anche.no>

pkgname=filerock-git
pkgver=37214f7
pkgrel=1
pkgdesc="Client for FileRock Secure Cloud Storage"
arch=(any)
url="http://www.filerock.com"
license=("GPL3")
depends=("python2"
         "python2-pbkdf2"
         "python2-crypto"
         "python2-imaging"
         "python2-apscheduler"
         "python2-setproctitle"
         "wxpython"
         "python2-socksipy-git"
         "python2-portalocker")
makedepends=("python2-distribute"
             "python2-distutils-extra")
source=('git+https://github.com/filerock/FileRock-Client.git#branch=master')
md5sums=('SKIP')

package() {
    _exec_const='EXECUTABLE_PATH'
    _args_const='COMMAND_LINE_ARGUMENTS'
    _exec_path="\/usr\/bin\/filerock"

    cd $srcdir/FileRock-Client

    sed -i "s/^$_exec_const = .*$/$_exec_const = \"$_exec_path\"/" setup.py
    sed -i "s/^$_args_const = .*$/$_args_const = []/" setup.py

    python2 setup.py install --root="$pkgdir" --prefix=/usr -O1

    mkdir -p "$pkgdir"/usr/share/applications/
    cp $srcdir/FileRock-Client/resources/filerock-client.desktop "$pkgdir"/usr/share/applications/
    sed -i "s/$_exec_const/$_exec_path/" "$pkgdir"/usr/share/applications/filerock-client.desktop

    mkdir -p "$pkgdir"/usr/share/pixmaps/
    cp $srcdir/FileRock-Client/resources/pixmaps/FileRock-Icon-128x128.png "$pkgdir"/usr/share/pixmaps/filerock-client.png

}

pkgver() {
    cd $srcdir/FileRock-Client
    git describe --always | sed 's|-|.|g'
}
