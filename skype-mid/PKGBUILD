# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=skype-mid
pkgver=3.0.0.93
pkgrel=4
pkgdesc="Skype version for MIDs (installs besides skype)"
arch=('i686' 'x86_64')
url="http://skype.com"
license=(custom)
# depends
if [ "${CARCH}" = "x86_64" ]; then
    # for x86_64
    depends=(lib32-libxss lib32-libxi lib32-libxrandr lib32-libxcursor lib32-libxinerama)
else 
    # for i686
    depends=('alsa-lib' 'libxv' 'libxss')
fi
install=skype-mid.install
source=('http://dl.dropbox.com/u/4514366/skype-3.0.0.93-generic.tar.bz2' 'LICENSE')
md5sums=(
    '1edf6e03d9d773cfb267dc12331abe31'
    '1c4bec33b1ee1611f194a7015bb55c4e'
)
         
build() {
    install -d ${pkgdir}/opt/${pkgname} \
        ${pkgdir}/usr/bin \
        ${pkgdir}/usr/share/{applications,pixmaps} \
        ${pkgdir}/usr/share/licenses/${pkgname} || return 1
    cp -r ${srcdir}/skype-${pkgver}/* ${pkgdir}/opt/${pkgname}
    # correcting skype.desktop
    sed -e 's/skype.png/skype-mid.png/g' \
        -e 's/Exec=skype/Exec=skype-mid --dbpath=~\/.skype-mid/g' \
        -e 's/Name=Skype/Name=Skype for MIDs/g' \
        ${srcdir}/skype-${pkgver}/skype.desktop > ${srcdir}/${pkgname}.desktop
    #creating skype-mid launch script
        sed -e 's/ .\// \/opt\/skype-mid\//g' \
            -e 's/=./=\/opt\/skype-mid\//g'  \
            ${srcdir}/skype-${pkgver}/skype > ${srcdir}/${pkgname}
    # installing icon, desktop and license files
    install -m644 ${srcdir}/skype-${pkgver}/icons/SkypeBlue_32x32.png \
        ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -m644 ${srcdir}/${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -m755 ${srcdir}/${pkgname} \
        ${pkgdir}/opt/${pkgname}/${pkgname}
    install -D -m 644 ${srcdir}/LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
} 
