#Maintainer: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=facebook-notify-git
pkgver=20100307
pkgrel=4
pkgdesc="Facebook notification monitor"
arch=("i686" "x86_64")
url="http://nzjrs.github.com/facebook-notify/"
license=("GPL")
provides=("facebook-notify")
depends=("python" "pygtk" "pywebkitgtk" "python-notify")
makedepends=("git")
_gitroot="git://github.com/nzjrs/facebook-notify"
_gitname="facebook-notify"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd "${srcdir}/${_gitname}"

    # Command would be 'facebook-notify.py'
    mv facebook-notify.py facebook-notify
    sed -i 's/facebook-notify.py/facebook-notify/' setup.py facebook.desktop

    # Install libfacebooknotify.facebook
    sed -i 's/packages=\["libfacebooknotify"\]/packages=["libfacebooknotify", "libfacebooknotify.facebook"]/' setup.py

    # Icons in wrong location
    sed -i 's_usr/__' setup.py
    sed -i '19a("share/pixmaps", ["icons/hicolor/48x48/apps/facebook.png"]),' setup.py

    python ./setup.py install --root "$pkgdir"
}
