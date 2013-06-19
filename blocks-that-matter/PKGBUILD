# Maintainer: ZDragon

pkgname=blocks-that-matter
pkgver=1.0.0.8
pkgrel=2
pkgdesc="Platformer with puzzle elements that form a mix of Tetris and Minecraft."
url="http://www.swingswingsubmarine.com/games/blocks-that-matter/"
license=('custom: "commercial"')
groups=('humblevoxatronbundle' 'humblebundles')
arch=('i686' 'x86_64')
depends=('java-runtime' 'bash')
options=(!strip)
PKGEXT='.pkg.tar'
sha256sums=('b3f9934c39624d7ac31f7de8fa660f0f150d383339fa3cea269f33442c006439'
        'a5245828006404ebb4f324727fa98deb149a84b076bd24bf5b1e49443bb9c2a5'
        'd6f8b24e1545009c7598be0bb0b36c40123a14210f4654813c85fbccd174c0f2')

[ "${CARCH}" = "x86_64" ] && depends+=('lib32-libxcursor' 'lib32-libxrandr')
[ "${CARCH}" = "i686" ]   && depends+=('libxcursor' 'libxrandr') 
[ "${CARCH}" = "x86_64" ] && optdepends=('lib32-alsa-lib: sound support' 'lib32-openal: sound support')
[ "${CARCH}" = "i686" ]   && optdepends=('alsa-lib: sound support' 'openal: sound support')
[ "${CARCH}" = "x86_64" ] && ext="x64" && sha256sums+=('1f0cec399b612412420962f38b51a57176bf41f4251e178343ecba9af127c236')
[ "${CARCH}" = "i686" ]   && ext="x86" && sha256sums+=('88fe876bf93385340846bfc78bbde98a4d4b488522fd2b620363038b7b8f9276')

_gamepkg="blocks-matter_${pkgver}_${ext}.tar.gz"
source=("${pkgname}.desktop" "btm-exec" "${pkgname}-icon.png" "hib://${_gamepkg}")
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package(){
  cd ${srcdir}

  ( 
    cd "blocks-matter_${pkgver}_${ext}"
    #Use system-wide OpenAL library instead of the provided lib versions
    rm libopenal64.so
    rm libopenal.so

    #fix permissions
    chmod +rx *.sh
    chmod +rx *.so
    chmod +rx *.jar
    chmod +rx BTM.bftm
    chmod -R +rx BTM_lib
    chmod -R +rx lib
    chmod -R +rx README
    chmod -R +rx Community
    chmod -R +wrx config
    chmod -R +wrx "Blocks That Matter Save"
  )

  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/btm-exec" "${pkgdir}/usr/bin/${pkgname}"

  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}-icon.png" \
        "${pkgdir}/usr/share/icons/${pkgname}-icon.png"

  #Install Game Files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mv -T "blocks-matter_${pkgver}_${ext}" "${pkgdir}/opt/${pkgname}"
}

