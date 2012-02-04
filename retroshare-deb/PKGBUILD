#Maintainer Thomas Schneider <maxmuserm@gmail.com>
pkgname=retroshare-deb
_pkgname=retroshare
_pkgver=0.5.2
pkgver=${_pkgver}a
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail.Based on the deb package (PKGBUILD is rgiht now an ugly hack and not ready for every day useage is still missing deps)"
arch=('i686' 'x86_64')
url="http://retroshare.sourceforge.net/"
license=('LGPL' 'GPL')
depends=('qt' 'openssl' 'libupnp' 'gpgme' 'libgnome-keyring' 'mesa' 'libxss')
install="retroshare.install"
source=("http://dfn.dl.sourceforge.net/project/retroshare/RetroShare/0.5.2a/RetroShare_${pkgver}.4550_debian_i386.deb" 
"retroshare.desktop")

build(){
cd $srcdir
ar x ../RetroShare*deb
tar xfz data.tar.gz
rm *.tar.gz
}

package(){
mv $srcdir/usr $pkgdir
  install -D -m 644 \
    "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

md5sums=('3aa9eb8b81bd9cb49ae1ce214f0e87f9'
         'f6dc374d95c775bc587ef13841abdab2')
