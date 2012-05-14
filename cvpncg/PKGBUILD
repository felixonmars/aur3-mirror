# Maintainer: Giorgio Gilestro <giorgio@gilestro@tk>
pkgname=cvpncg
pkgver=0.6
debrel=1
pkgrel=4
pkgdesc="A GUI for the cisco vpnclient"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/guiforciscovpnc/"
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/guiforciscovpnc/cvpncg/0.6/${pkgname}_${pkgver}-${debrel}.deb)
license=('GPL')
depends=('cisco-vpnclient' 'python2' 'pygtk' 'vte')
md5sums=('7acca648878c4df1ca78193b5a010519')

build() {
   cd $srcdir
   ar xv ${pkgname}_${pkgver}-${debrel}.deb
   tar zxvf data.tar.gz
   mkdir -p ${pkgdir}/usr/share/{doc/cvpncg,locale,cvpncg,applications,pixmaps}
   mkdir -p ${pkgdir}/usr/bin
   mkdir -p ${pkgdir}/usr/local/bin
   install -D ./usr/share/doc/cvpncg/changelog.Debian.gz ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/doc/cvpncg/NEWS.gz ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/doc/cvpncg/copyright ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/doc/cvpncg/changelog.gz ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/doc/cvpncg/README.Debian ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/doc/cvpncg/README ${pkgdir}/usr/share/doc/cvpncg/
   install -D ./usr/share/cvpncg/cvpncg.py ${pkgdir}/usr/share/cvpncg/
   install -D ./usr/share/applications/cvpncg.desktop ${pkgdir}/usr/share/applications/
   install -D ./usr/share/pixmaps/cvpncg.png ${pkgdir}/usr/share/pixmaps/
   install -D ./usr/share/pixmaps/cvpncg_status_unlocked.png ${pkgdir}/usr/share/pixmaps/
   install -D ./usr/share/pixmaps/cvpncg_status_locked.png ${pkgdir}/usr/share/pixmaps/
   
   sed -i s/python/python2/ "${pkgdir}/usr/share/cvpncg/cvpncg.py"
}
