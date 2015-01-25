# Maintainer: Luca Béla Palkovics <luca.bela.palkovics@gmail.com>

pkgrel=1
pkgver=20150120
pkgname=('nautilus-snapper-extension-git')
pkgdesc="Extension for nautilus, adds ability to open old versions of files, when snapper is used"
url="https://github.com/KoKuToru/nautilus-snapper-extension.git"
license='GPL2'
arch=('i686' 'x86_64')
depends=('python2-nautilus' 'xdg-utils')
source=(.AURINFO "${pkgname%-git}::git+https://github.com/KoKuToru/nautilus-snapper-extension.git")
sha256sums=('SKIP' 'SKIP')
provides=('nautilus-snapper-extension-git')
conflicts=('nautilus-snapper-extension-git')

pkgver()
{
     cd ${pkgname%-git}
     git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package()
{
    mkdir -p ${pkgdir}/usr/share/nautilus-python/extensions/
    cp ${pkgname%-git}/*.py ${pkgdir}/usr/share/nautilus-python/extensions/
}
