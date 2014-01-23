#Maintainer Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=cutereport
pkgver=1.0beta1
pkgrel=1
pkgdesc="CuteReport is a free report solution. It is based on Qt4 framework and can be easily integrated into any Qt application."
arch=('i686' 'x86_64')
url="http://cute-report.com/"
license=('LGPL')
install=${pkgname}.install
depends=('qt4>=4.8.5')

source=("http://cute-report.com/component/jdownloads/finish/6-sources/17-source-code/0?Itemid=0"
	"cutereport.desktop"
	"cutereport.ico")	
	
md5sums=('4137800ae893e2d51020f88ce7ccbc62'
	'8b6f37966d12eec17243f773c9193313'
	'03adbfdf8ba7bf22d5bd8b5197a39d3f')

build()
{
    cd $srcdir/alfox-report-4ef96c09e819
    #uncomment defines += SYSTEMINSTALL to install it on linux system
    sed -i '4s/#//' common.pri
    #uncomment REPORT_ROOT_PATH = "/usr" to set the default root path
    sed -i '7s/#//' common.pri
    #comment REPORT_ROOT_PATH = "/home/alex/temp/install/cutereport/" to unset the default root path
    sed -i '8s/REPORT/#REPORT/' common.pri
    #path for variables in home dir moved to hidden folder
    sed -i '11s/temp/.cutereport\/temp/' common.pri
    
    qmake-qt4 || return 1
    #make -j8 || return 1    
    make || return 1    
}
	    
package() 
{    
    cd $srcdir/alfox-report-4ef96c09e819
    make INSTALL_ROOT="${pkgdir}" install
    
    install -Dm644 $startdir/cutereport.ico "$pkgdir/usr/share/pixmaps/cutereport.ico"
    install -Dm644 $startdir/cutereport.desktop "$pkgdir/usr/share/applications/cutereport.desktop"        
    
}
