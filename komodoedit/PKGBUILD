# Maintainer: max-k <max-k@post.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="8.0.1"
_minor=12353

pkgname="komodoedit"
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="Open-Source version of ActiveState Komodo IDE - Based on XUL"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-edit"
license=('MPL')
depends=('glibc>=2.4' 'libjpeg>=6.2' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used by komodo-toolbox')
conflicts=('komodoedit-nightly' 'komodoedit-beta')

source=("http://downloads.activestate.com/Komodo/releases/${_major}/Komodo-Edit-${_major}-${_minor}-linux-${_arch}.tar.gz")

if [ $_arch = "x86_64" ] ; then
md5sums=('5ea1c05f2e9d418ba55a5943537962bc')
sha256sums=('f53f2ba8dd5a25d61a63d1f5337c3367a69e445774ffdad6ac89b0099e186da4')
else
md5sums=('16d06ee055fa367feafe96274e94b0af')
sha256sums=('a3381f5c9fd72f9a4f7e8384a4e52b0428c147063960d8e4074876d3612c5610')
fi

build() {
cd ${srcdir}/Komodo-Edit-${_major}-${_minor}-linux-${_arch}
sed -i 's/^    print/   #print\n   /g' support/_install.py
sed -i 's/root.addHandler(console)/#root.addHandler(console)/' support/_install.py
./install.sh -s -I ${pkgdir}/opt/${pkgname} --dest-dir ${pkgdir}/opt/${pkgname} 2>&1 | sed "s#${pkgdir}##" || exit 1
grep -v ${srcdir} ${pkgdir}/opt/${pkgname}/share/desktop/komodo-edit-8.desktop > ${srcdir}/${pkgname}.desktop
echo "Exec=/opt/${pkgname}/bin/komodo %F" >> ${srcdir}/${pkgname}.desktop
echo "Icon=/opt/${pkgname}/share/icons/komodo128.png" >> ${srcdir}/${pkgname}.desktop
install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
ln -sf "/opt/${pkgname}/lib/mozilla/komodo" "${pkgdir}/opt/${pkgname}/bin/komodo"
install -d "${pkgdir}/usr/local/bin"
ln -s "/opt/${pkgname}/bin/komodo" "${pkgdir}/usr/local/bin/komodo"
}
