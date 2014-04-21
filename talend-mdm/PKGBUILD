# Maintainer: Christopher Heien <chris.h.heien@gmail.com>

pkgname="talend-mdm"
#_altname=""
_shortname="TOS_MDM"
pkgver="5.4.1"
_build="r111943"
pkgrel=1
pkgdesc="Master Data Management software suite."
arch=('i686' 'x86_64')
url=("http://www.talend.com")
license=('GPL2')
depends=('gtk2' 'glib2')
makedepends=('unzip')
options=('!strip')
source=("http://talend.dreamhosters.com/tmdmce/release/V$pkgver/${_shortname}-All-${_build}-V$pkgver.zip"	
	"TalendMDMCommunityEdition.desktop")
sha1sums=('347b240b96094e1fdb323d853989d144fa7ffc4b'
          '75ec4158dd53f11657e005fb41ca64500613c4ea')

package(){
	
    install -dm755 ${pkgdir}/opt/${pkgname} ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
    
    cd ${srcdir}
    install -m644 ${_shortname}-Server-${_build}-V${pkgver}.jar ${pkgdir}/opt/${pkgname}

    unzip -o ${_shortname}-Studio-${_build}-V${pkgver}.zip
    cd ${_shortname}-Studio-${_build}-V${pkgver}
   
    # Remove all non-Linux startup scripts   
    rm -rf  *macosx* *solaris* *gtk-ppc* *win*
    
    # Install files
    cp -Rp * ${pkgdir}/opt/${pkgname}
    
    # Link application icon
    ln -s /opt/${pkgname}/plugins/org.talend.rcp.branding.tombundle_${pkgver}.${_build}/icons/appli_32x32.gif ${pkgdir}/opt/${pkgname}/icon.gif

    # Link executable based on architecture
    install -m 0755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications/
    
    ln -s /opt/${pkgname}/${_shortname}-linux-gtk-${CARCH//i6/x} ${pkgdir}/usr/bin/${pkgname}
    chmod +x ${pkgdir}/opt/${pkgname}/${_shortname}-linux-gtk-${CARCH//i6/x} 
}

