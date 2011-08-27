# Maintainer: Christopher Heien <chris.h.heien@gmail.com>

pkgname="talend-profiler"
_altname="Talend Open Profiler"
_shortname="TOP"
_altshortname="top"
pkgver="4.2.2"
_build="r63143"
pkgrel=2
pkgdesc="Data quality software suite."
arch=('i686' 'x86_64')
url=("http://www.talend.com")
license=("GPL2")
depends=("gtk2" "glib2")



options=("!strip")
source=("http://downloads.sourceforge.net/project/${pkgname//-/}/${pkgname//-/}/${pkgver}/${_shortname}-All-${_build}-V${pkgver}.zip" 
	"${_altname// /}.desktop")
sha1sums=("23b5bf13147a5666056118528eac8229b2b26922"
	  "b493037566023e8d826d5461397f0434d41d019b")
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
