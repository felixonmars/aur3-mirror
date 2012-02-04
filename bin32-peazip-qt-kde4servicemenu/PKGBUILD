# Maintainer: Blissful <narthanaepa 47 gmail |)07 com>
# Based on peazip-qt by: TuxSpirit<tuxspiriATarchlinuxDOTfr>

pkgname=bin32-peazip-qt-kde4servicemenu
pkgver=4.2
_namefile=peazip-$pkgver.LINUX.Qt
_namedest=peazip
pkgrel=1
pkgdesc="QT archiver utility"
arch=('x86_64')
url="http://www.peazip.org/peazip-linux.html"
license=('LGPL')
depends=('gdk-pixbuf' 'p7zip' 'quad' 'balz' 'unace' 'upx' 'curl' 'lib32-qt' 'lib32-ncurses' 'lib32-gmp4')
conflicts=('peazip-portable-qt' 'peazip-gtk1' 'peazip-portable-gtk1' 'peazip-gtk2' 'peazip-portable-gtk2' 'peazip-beta-gtk2' 'peazip-gtk2' 'peazip-qt')
install=${pkgname}.install
source=(http://peazip.googlecode.com/files/$_namefile.tgz
	peazipadd.desktop)
sha1sums=('1942ec94fc2b0941c3a16588e139cb6d67b60412'
          '78f690ee15974feab716f3458e18da6110c3e4eb')

build() {  
  # Addtional structures  
  install -d -m 755 ${pkgdir}/usr/lib/${_namedest}/res 
  install -d -m 755 ${pkgdir}/usr/lib/${_namedest}/res/{7z,arc,icons,lang,lpaq,paq,quad,themes,unace,upx,zpaq} 
  install -d -m 755 ${pkgdir}/usr/lib/${_namedest}/res/7z/Codecs 
  install -d -m 755 ${pkgdir}/usr/lib/${_namedest}/res/themes/{nographic-embedded,seven-embedded} 
  
  #Program
  install -D -m 755 ${srcdir}/usr/local/share/PeaZip/peazip ${pkgdir}/usr/lib/${_namedest}/peazip

  # Additional files
  # qt4 pascal bindings
  install -m 644 ${srcdir}/usr/local/share/PeaZip/libQt4Pas.so ${pkgdir}/usr/lib/libQt4Pas.so
  ln -s libQt4Pas.so ${pkgdir}/usr/lib/libQt4Pas.so.5

  # res 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/{altconf.txt,pea,pealauncher,rnd} ${pkgdir}/usr/lib/${_namedest}/res 
  install -m 644 ${srcdir}/usr/local/share/PeaZip/peazip_help.pdf ${pkgdir}/usr/lib/${_namedest}/res/peazip_help.pdf
 
  # icons
  install -m 644 ${srcdir}/usr/local/share/icons/peazip.png ${pkgdir}/usr/lib/${_namedest}/res/icons/peazip.png

  # Lang 
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/lang/* ${pkgdir}/usr/lib/${_namedest}/res/lang/ 
  
  # arc
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/arc/arc* ${pkgdir}/usr/lib/${_namedest}/res/arc/ 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/arc/freearc* ${pkgdir}/usr/lib/${_namedest}/res/arc/  

  # lpaq 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/lpaq/lpaq* ${pkgdir}/usr/lib/${_namedest}/res/lpaq/ 

  # paq 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/paq/paq* ${pkgdir}/usr/lib/${_namedest}/res/paq/ 

  # Theme - nographic-embedded
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/nographic-embedded/* ${pkgdir}/usr/lib/${_namedest}/res/themes/nographic-embedded/ 
  #       - seven-embedded
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/seven-embedded/* ${pkgdir}/usr/lib/${_namedest}/res/themes/seven-embedded/
  #       - 7z theme archives
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/*.7z ${pkgdir}/usr/lib/${_namedest}/res/themes/

  # zpac
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/zpaq/* ${pkgdir}/usr/lib/${_namedest}/res/zpaq/

  # Users - Desktop 
  install -D -m 644 ${srcdir}/usr/local/share/applications/peazip.desktop ${pkgdir}/usr/share/applications/peazip.desktop 

  # Service Menu
  install -D -m 644 ${srcdir}/peazipadd.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/peazipadd.desktop

  # Fix peazip.desktop : icon, name
  sed -i "s|Icon=peazip.png|Icon=/usr/lib/peazip/res/icons/peazip.png|" ${pkgdir}/usr/share/applications/peazip.desktop || return 1
  sed -i "s|peazip.desktop|PeaZip|" ${pkgdir}/usr/share/applications/peazip.desktop || return 1
}