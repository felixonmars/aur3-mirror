# Contributor: Steven E. Lamberson, Jr. <steven dot lamberson at gmail dot com>

pkgname=openbox-nodoka
pkgver=20090722
pkgrel=1
pkgdesc="Nodoka Openbox Theme"
arch=('i686' 'x86_64')
url="http://box-look.org/content/show.php?content=81958"
license=('GPL')
depends=('openbox')
source=(http://box-look.org/CONTENT/content-files/81958-Openbox_Nodoka.tar.gz)
md5sums=('a5d175c9994c6342cf0aab3e28a5e5b1')

build() {
    install -d ${pkgdir}/usr/share/themes/
    mv ${srcdir}/Openbox\ Nodoka ${srcdir}/Openbox-Nodoka
    cp -r ${srcdir}/Openbox-Nodoka ${pkgdir}/usr/share/themes || return 1
}
