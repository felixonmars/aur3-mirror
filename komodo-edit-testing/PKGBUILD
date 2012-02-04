# Maintainer: Jamie Paton <jamie.paton@googlemail.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="7.0.0c2"
_majoralt="7.0.0-rc2"
_minor=9400


pkgname="komodo-edit-testing"
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="ActiveState Komodo Edit - Developer Preview Release"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-edit"
license=('MPL')
depends=('glibc>=2.4' 'libjpeg>=6.2' 'gcc-libs' 'gtk2')

optdepends=()
conflicts=()

options=(!strip)
source=("http://downloads.activestate.com/Komodo/releases/${_major}/Komodo-Edit-${_majoralt}-${_minor}-linux-${_arch}.tar.gz")

if [ $_arch = "x86_64" ]; then
  md5sums=('347668e83abcb5bfdce446e4076d5100')
else
  md5sums=('aab3d67ed02c281098b965cb0fc5445a')
fi

build() {
cd ${startdir}/src/Komodo-Edit-${_majoralt}-${_minor}-linux-${_arch}
./install.sh -s -I ${startdir}/pkg/opt/${pkgname}
sed -i 's/Komodo\ Edit-7.desktop/Komodo\ Edit\ 7/' ${startdir}/pkg/opt/${pkgname}/share/desktop/komodo-edit-7.desktop
grep -v ${startdir} ${startdir}/pkg/opt/${pkgname}/share/desktop/komodo-edit-7.desktop > ${startdir}/${pkgname}.desktop
echo "Exec=/opt/${pkgname}/bin/komodo %F" >> ${startdir}/${pkgname}.desktop
echo "Icon=/opt/${pkgname}/share/icons/komodo48.png" >> ${startdir}/${pkgname}.desktop
install -D -m 644 ${startdir}/${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
