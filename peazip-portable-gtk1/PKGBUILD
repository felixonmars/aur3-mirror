# Maintainer: TuxSpirit<tuxspirit@archlinux.fr>   2008/05/30 21:00 CET TuxSpirit 

namedest=peazip
pkgname=peazip-portable-gtk1 
pkgver=2.1
namefile=peazip_portable-$pkgver.bin.LINUX.GTK1.i586-1
pkgrel=1 
pkgdesc="Portable GTK1 archiver utility" 
arch=('i686') 
license=('LGPL') 
depends=('gcc-libs' 'gdk-pixbuf' 'p7zip' 'quad' 'unace' 'upx' 'curl' 'gmp') 
conflicts=('peazip-gtk2' 'peazip-portable-gtk2') 
url="http://sourceforge.net/projects/peazip/" 
source=(http://downloads.sourceforge.net/peazip/$namefile.tar.gz) 
install=${pkgname}.install  
md5sums=('42a770bf09b76680804cb1960778f4ec')
build() { 

  # Program 
  install -D -m 755 ${startdir}/src/${namefile}/peazip ${startdir}/pkg/usr/bin/peazip 
  
  # Addtional structures 
  install -d -m 755 ${startdir}/pkg/usr/lib/${namedest}/res 
  install -d -m 755 ${startdir}/pkg/usr/lib/${namedest}/res/{7z,arc,icons,lang,lpaq,paq,quad,themes,unace,upx} 
  install -d -m 755 ${startdir}/pkg/usr/lib/${namedest}/res/7z/Codecs 
  install -d -m 755 ${startdir}/pkg/usr/lib/${namedest}/res/themes/{crystalc,tango} 

  # Additional files 
  # res 
  install -m 755 ${startdir}/src/${namefile}/res/* ${startdir}/pkg/usr/lib/${namedest}/res 

  # Lang 
  install -m 644 ${startdir}/src/${namefile}/res/lang/en.txt ${startdir}/pkg/usr/lib/${namedest}/res/lang/en.txt 

  # arc
  install -m 755 ${startdir}/src/${namefile}/res/arc/arc* ${startdir}/pkg/usr/lib/${namedest}/res/arc/ 
  
  # lpaq 
  install -m 755 ${startdir}/src/${namefile}/res/lpaq/lpaq* ${startdir}/pkg/usr/lib/${namedest}/res/lpaq/ 

  # paq 
  install -m 755 ${startdir}/src/${namefile}/res/paq/paq* ${startdir}/pkg/usr/lib/${namedest}/res/paq/ 
  
  # Theme - crystalc 
  install -m 644 ${startdir}/src/${namefile}/res/themes/crystalc/* ${startdir}/pkg/usr/lib/${namedest}/res/themes/crystalc/ 

  # Theme - tango 
  install -m 644 ${startdir}/src/${namefile}/res/themes/tango/* ${startdir}/pkg/usr/lib/${namedest}/res/themes/tango/ 

  # Users - Desktop 
  install -D -m 644 ${startdir}/src/${namefile}/FreeDesktop_integration/peazip.desktop ${startdir}/pkg/usr/share/applications/peazip.desktop 

} 
