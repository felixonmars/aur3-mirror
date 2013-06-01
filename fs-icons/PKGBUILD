# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=fs-icons
pkgver=0.7
pkgrel=2
pkgdesc="The Frank Souza icon theme"
url="http://franksouza183.deviantart.com/art/FS-Icons-288489126"
license=('GPL')
arch=('any')
options=(!emptydirs)
source=("http://fc03.deviantart.net/fs70/f/2012/074/2/5/fs_icons_by_franksouza183-d4rrbmu.zip")
sha256sums=('fae874a056b4aa71235e2171316064b66a35e55b8071086290f3a332a1461b69')

package() {
	mkdir -p ${pkgdir}/usr/share/icons/
    for T in *tar.gz
            do
                local FOLDER=`basename $T .tar.gz`
                mkdir $FOLDER
                bsdtar -zxf $T -C $FOLDER
            done
    #remove broken symlinks
    find -name application-x-msi.png -delete

    cp -r */ ${pkgdir}/usr/share/icons/
}
