# Maintainer: Your Name <arik.kfir@gmail.com>

###################################################
# General information about the package
###################################################
pkgname=intellij-idea
pkgver=135.815
pkgrel=1
pkgdesc="The most intelligent IDE for Java and other technologies"
arch=('any')
url="http://www.jetbrains.com/idea/"
license=('unknown')
groups=('arikkfir')
depends=('java-environment' 'bash')
options=('emptydirs' '!strip')
changelog=ChangeLog
source=("${pkgname}::http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz"
        "${pkgname}-src::http://download.jetbrains.com/idea/ideaIC-${pkgver}-src.tar.bz2"
        "jetbrains-idea.desktop")
sha256sums=('bb987dbd43587be25d2f9da44dd688e7e38dcde90d69dde1193adeb08e0b1b49'
            '33c14fb1e5dcaf62d364c7db5bee53f137748d1cbe41a7ac1dabfaa2ea65ddcc'
            'e156cedc06fabecb771d6e768bb30745d0ee48d61f8d50f5030ba8d88e8ddd2c')

###################################################
# Package
###################################################
package() {
    
    targetDir="${pkgdir}/opt/jetbrains/${pkgname}"
    mkdir -p ${targetDir}
    mkdir -p ${targetDir}/src
    mkdir -p ${pkgdir}/usr/share/applications

    mv ${srcdir}/idea-IU-${pkgver}/* ${targetDir}
    cp ${srcdir}/jetbrains-idea.desktop ${pkgdir}/usr/share/applications
    mv ${srcdir}/ideaIC-${pkgver}/* ${targetDir}/src
    
    sed --in-place -e "
            s,-Xms.*,-Xms1g,g;
            s,-Xmx.*,-Xmx2g,g;
            s,-Dawt.useSystemAAFontSettings=lcd,-Dawt.useSystemAAFontSettings=on,g;" ${targetDir}/bin/idea.vmoptions
    echo "-Dswing.aatext=true" >> ${targetDir}/bin/idea.vmoptions
    sed --in-place -e "
            s,-Xms.*,-Xms1g,g;
            s,-Xmx.*,-Xmx2g,g;
            s,-Dawt.useSystemAAFontSettings=lcd,-Dawt.useSystemAAFontSettings=on,g;" ${targetDir}/bin/idea64.vmoptions
    echo "-Dswing.aatext=true" >> ${targetDir}/bin/idea64.vmoptions
                
}

