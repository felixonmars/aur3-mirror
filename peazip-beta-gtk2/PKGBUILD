# Maintainer: TuxSpirit<tuxspiritATarchlinuxDOTfr> 

namedest=peazip-beta
pkgname=peazip-beta-gtk2 
pkgver=3.1
namefile=peazip-$pkgver.beta.LINUX.GTK2
pkgrel=1 
pkgdesc="GTK2 archiver utility (BETA VERSION)" 
arch=('i686') 
license=('LGPL') 
depends=('gcc-libs' 'gdk-pixbuf' 'p7zip' 'quad' 'balz' 'unace' 'upx' 'curl' 'gmp' 'gtk2') 
replaces=('peazip-portable-beta-gkt2')
conflicts=('peazip-gtk1' 'peazip-portable-gtk1' 'peazip-portable-gtk2' 'peazip-portable-qt' 'peazip-beta-qt') 
url="http://sourceforge.net/projects/peazip/" 
source=(http://downloads.sourceforge.net/peazip/$namefile.tgz
        peazip16.png
	peazip32.png
	peazip48.png 
	peazip64.png
	peazip96.png
	peazip.desktop)
install=${pkgname}.install
md5sums=('2f11b977c1b7dc33c9aa57adb44648bf'
         'fd7b1179f6d823afd256f71feeaa6822'
         '387b17d06070d81a98052ba9e6455bfd'
         '4cc39ec364657924532be5f7135f2f89'
         '21e40fefb6b82d1a11fef11470f338f4'
         '01a2a8edbce15f34430ec03d9325263c'
         '38593076980866883c15f8f1594102b6')
	 
build() { 
    
  # Addtional structures  
  install -d -m 755 ${pkgdir}/usr/lib/${namedest}/res 
  install -d -m 755 ${pkgdir}/usr/lib/${namedest}/res/{7z,arc,icons,lang,lpaq,paq,quad,themes,unace,upx,zpaq} 
  install -d -m 755 ${pkgdir}/usr/lib/${namedest}/res/7z/Codecs 
  install -d -m 755 ${pkgdir}/usr/lib/${namedest}/res/themes/{firecrystal,nographic,seven} 

  #Program
  install -D -m 755 ${srcdir}/usr/local/share/PeaZip/peazip ${pkgdir}/usr/lib/${namedest}/peazip

  # Additional files 
  # res 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/* ${pkgdir}/usr/lib/${namedest}/res 
  install -m 644 ${srcdir}/usr/local/share/PeaZip/peazip_help.pdf ${pkgdir}/usr/lib/${namedest}/res/peazip_help.pdf
 
  # icons
  install -m 644 ${srcdir}/*.png ${pkgdir}/usr/lib/${namedest}/res/icons
  install -m 644 ${srcdir}/usr/local/share/icons/peazip.png ${pkgdir}/usr/lib/${namedest}/res/icons/peazip.png

  # Lang 
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/lang/* ${pkgdir}/usr/lib/${namedest}/res/lang/ 
  
  # arc
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/arc/arc* ${pkgdir}/usr/lib/${namedest}/res/arc/ 
  
  # lpaq 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/lpaq/lpaq* ${pkgdir}/usr/lib/${namedest}/res/lpaq/ 

  # paq 
  install -m 755 ${srcdir}/usr/local/share/PeaZip/res/paq/paq* ${pkgdir}/usr/lib/${namedest}/res/paq/ 

  # Theme - firecrystal
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/firecrystal/* ${pkgdir}/usr/lib/${namedest}/res/themes/firecrystal/ 
           #  nographic
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/nographic/* ${pkgdir}/usr/lib/${namedest}/res/themes/nographic/ 

           # seven
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/themes/seven/* ${pkgdir}/usr/lib/${namedest}/res/themes/seven/ 

  # zpac
  install -m 644 ${srcdir}/usr/local/share/PeaZip/res/zpaq/* ${pkgdir}/usr/lib/${namedest}/res/zpaq/

  # Users - Desktop 
  install -D -m 644 ${srcdir}/peazip.desktop ${pkgdir}/usr/share/applications/peazip.desktop 

} 

