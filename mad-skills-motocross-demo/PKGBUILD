# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com

pkgname=mad-skills-motocross-demo
_realname="Mad Skills Motocross Demo"
pkgver=1
pkgrel=2

pkgdesc='Mad Skills Motocross is a side-scrolling racing game (demo).'
url='http://www.madskillsmotocross.com/'
arch=('i686' 'x86_64')

source=('http://d2ughln6tb9evk.cloudfront.net/MadSkillsMotocrossDemo.tar.gz'
        'msm-demo.desktop'
        'msm-demo'
        'msm-demo.install')
md5sums=('e5fdbf9682763e47290465493d619b45'
         'e74a0633936666a01cf193d4b21a14aa'
         'b8b1b312690e014e6ca32c95c603cde6'
         '0729ef886bc6190ffaa63026136bf394')

depends=('java-environment')
makedepends=('imagemagick')
license=('custom')
options=(!strip)

install=msm-demo.install

package() {
    cd ${srcdir}/"${_realname}"

    # extract the icon from resources.jar and install it
    mkdir -p /tmp/msm-resources
    unzip -q data/resources.jar images/gui/logomenu.png -d /tmp/msm-resources 
    convert  /tmp/msm-resources/images/gui/logomenu.png \
    -resize 128x128 ./msm-demo.png
    mkdir -p ${pkgdir}/usr/share/icons
    mv ./msm-demo.png ${pkgdir}/usr/share/icons
    rm -rf /tmp/msm-resources

    # install the .desktop file and launcher
    mkdir -p ${pkgdir}/usr/share/applications      
    cp ${srcdir}/msm-demo.desktop ${pkgdir}/usr/share/applications/

    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/msm-demo ${pkgdir}/usr/bin/
    chmod 755 ${pkgdir}/usr/bin/msm-demo

    # install the game files
    mkdir -p ${pkgdir}/opt/mad-skills-motocross-demo
    mv * ${pkgdir}/opt/mad-skills-motocross-demo/
}
