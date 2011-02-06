# Contributor: Todd Partridge (Gen2ly) toddrpartridge (at) gmail 
# Contributor: Brett Bohnenkamper (kittykatt) kittykatt (at) silverirc.com

pkgname=gtk-theme-archsimple
_pkgname=ArchSimple
_pkgname2=ArchSimple-Grey
pkgver=0.4
pkgrel=2
pkgdesc="Simpified theme for various desktops based on the Arch Linux color scheme"
arch=('i686' 'x86_64' 'ppc')
url="http://gnome-look.org/content/show.php?content=118415"
license=('GPL')
depends=('gtk2' 'gtk-engines' 'gtk-engine-murrine-git')
install=${pkgname}.install
source=(http://gnome-look.org/CONTENT/content-files/118415-${_pkgname}.tar.gz)
md5sums=('4b9fa4f93af6e34b645d143558e66d90')


build() {
  
  # Variables for common folders
  _g2=gtk-2.0
  _o3=openbox-3
  _xf=xfwm4
  _pk=PekWM
  
  # Create pkgdir directories (ArchSimple)
  install -d ${pkgdir}/usr/share/themes/${_pkgname}/${_g2}/  # GTK,Opbox,XF
  install -d ${pkgdir}/usr/share/themes/${_pkgname}/${_o3}/  # Openbox
  install -d ${pkgdir}/usr/share/themes/${_pkgname}/${_xf}/  # XFWM4
  install -d ${pkgdir}/usr/share/themes/${_pkgname}/${_pk}   # PekWM
  
  # Create pkgdir directories (ArchSimple-Grey)
  install -d ${pkgdir}/usr/share/themes/${_pkgname2}/${_g2}/ # GTK
  install -d ${pkgdir}/usr/share/themes/${_pkgname2}/${_o3}/ # Openbox
  install -d ${pkgdir}/usr/share/themes/${_pkgname2}/${_xf}/ # XFWM4
  install -d ${pkgdir}/usr/share/themes/${_pkgname2}/${_pk}/ # PekWM
  
  # ArchSimple install      (GTK, Openbox, PekWM, XFWM4 themes)
  cd ${srcdir}/${_pkgname}/GTK-XFWM4-Openbox/${_pkgname}
  install -m644 ${_g2}/* ${pkgdir}/usr/share/themes/${_pkgname}/${_g2}/
  install -m644 ${_o3}/* ${pkgdir}/usr/share/themes/${_pkgname}/${_o3}/
  install -m644 ${_xf}/* ${pkgdir}/usr/share/themes/${_pkgname}/${_xf}/
  cd ${srcdir}/${_pkgname}/PekWM
  install -m644 ${_pkgname}/* ${pkgdir}/usr/share/themes/${_pkgname}/${_pk}/

  # ArchSimple-Grey install (GTK, Openbox, PekWM, XFWM4 themes)
  cd ${srcdir}/${_pkgname}/GTK-XFWM4-Openbox/${_pkgname2}
  install -m644 ${_g2}/* ${pkgdir}/usr/share/themes/${_pkgname2}/${_g2}/
  install -m644 ${_o3}/* ${pkgdir}/usr/share/themes/${_pkgname2}/${_o3}/
  install -m644 ${_xf}/* ${pkgdir}/usr/share/themes/${_pkgname2}/${_xf}/
  cd ${srcdir}/${_pkgname}/PekWM
  install -m644 ${_pkgname2}/* ${pkgdir}/usr/share/themes/${_pkgname2}/${_pk}/
}
