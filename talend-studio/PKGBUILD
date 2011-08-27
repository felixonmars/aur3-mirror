# Maintainer: Christopher Heien <chris.h.heien@gmail.com>

pkgname="talend-studio"
_altname="Talend Open Studio"
_shortname="TOS"
_altshortname="tos"
pkgver="4.2.2"
_build="r63143"
pkgrel=2
pkgdesc="Data and Information Quality software suite."
arch=('i686' 'x86_64')
url=("http://www.talend.com")
license=("GPL2")
depends=("gtk2" "glib2")
optdepends=('talend-profiler: data profiling suite'
	    'talend-mdm: master data management suite')

options=("!strip")
source=("http://downloads.sourceforge.net/project/${pkgname}/${_altname// /%20}/${pkgver}/${_shortname}-All-${_build}-V${pkgver}.zip"
	"${_altname// /}.desktop")
sha1sums=("cd633bc04be078be3e0acd8a14eb0b408c56094d"
	  "923d5b82515087ff2d757e081e1d8eaa0a01cd3f")
build(){
	
    install -dm755 ${pkgdir}/opt ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications || return 1    
    
    # Remove all non-Linux startup scripts   
    cd ${srcdir}/${_shortname}-All-${_build}-V${pkgver} &&
    rm -rf  *macosx* *solaris* *gtk-ppc* *win* || return 1
  
    cp -Rp ${srcdir}/${_shortname}-All-${_build}-V${pkgver} ${pkgdir}/opt/${pkgname} || return 1

    # Link application icon
    ln -s /opt/${pkgname}/plugins/org.talend.rcp.branding.${_altshortname}_${pkgver}.${_build}/icons/appli_32x32.gif ${pkgdir}/opt/${pkgname}/icon.gif

    # Link executable based on architecture
    install -m 0755 ${srcdir}/${_altname// /}.desktop ${pkgdir}/usr/share/applications/ || return 1
    
    ln -s /opt/${pkgname}/${_altname// /}-linux-gtk-${CARCH//i6/x} ${pkgdir}/usr/bin/${pkgname} || return 1
    chmod +x ${pkgdir}/opt/${pkgname}/${_altname// /}-linux-gtk-${CARCH//i6/x} || return 1      
}

