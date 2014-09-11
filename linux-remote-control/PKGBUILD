# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=linux-remote-control
pkgver=0.4
pkgrel=1
pkgdesc="Turn any device into a complete remote control for your GNU/Linux."
url="http://www.linuxremotecontrol.com/"
arch=('any')
license=('GPL v2')
install=linux-remote-control.install
depends=('nodejs' 'xdotool' 'xorg-xbacklight')
conflicts=('linux-remote-control-git')
md5sums=('d0667b7bfc5c409da948f4460d682c4d') 
source=("$pkgname.deb"::'http://www.linuxremotecontrol.com/lrc-ffos.deb')


package() {

    cd ${srcdir}/
    
    msg2 "  -> Extracting files..."
    tar xvzf data.tar.gz -C .
    
    msg2 "  -> Installing program..."
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/opt/"* "$pkgdir/opt/$pkgname/"
   
} 

    
    



