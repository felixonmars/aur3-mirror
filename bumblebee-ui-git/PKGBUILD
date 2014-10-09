# Contributor: Fincer <fincer89 at hotmail dot com>
# Created: 08/10/2014
pkgname=bumblebee-ui-git
pkgver=1
pkgrel=1
pkgdesc='Graphical Interface for Bumblebee daemon (GTK).'
arch=('any')
url='https://github.com/Bumblebee-Project/bumblebee-ui'
license="GPL"
depends=('bumblebee' 'python2' 'pygtk' 'libappindicator-gtk2' 'python2-notify')
makedepends=('git' 'sed')
_gitroot=git://github.com/Bumblebee-Project/bumblebee-ui.git
_gitname=bumblebee-ui

package()
{
    cd $srcdir/
    
    msg "Connecting to the GIT server...."
    if [[ -d $srcdir/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: $pkgname"
   
    cd $srcdir/${_gitname}
    
   mkdir -p "$pkgdir/usr/share/bumblebee-ui/"
   mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
   cp -ar "$srcdir/${_gitname}"/icons/* "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
   cp -ar "$srcdir/${_gitname}"/app/* "$pkgdir/usr/share/bumblebee-ui/"
   sed -i "s#Exec=bumblebee-app-settings#Exec=python2 /usr/share/bumblebee-ui/AppSettings.py#" "$srcdir/${_gitname}/bumblebee-app-settings.desktop"
   sed -i "s#Exec=bumblebee-indicator#Exec=python2 /usr/share/bumblebee-ui/Bumblebee-Indicator.py#" "$srcdir/${_gitname}/bumblebee-indicator.desktop"
   install -Dm644 "$srcdir/${_gitname}/bumblebee-app-settings.desktop" "$pkgdir/usr/share/applications/bumblebee-app-settings.desktop"
   install -Dm644 "$srcdir/${_gitname}/bumblebee-indicator.desktop" "$pkgdir/usr/share/applications/bumblebee-indicator.desktop"
}
