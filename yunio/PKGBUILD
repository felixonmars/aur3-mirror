# Maintainer: shmilee <shmilee.zju@gmail.com>
# Coutributer: ccgo8 <long-1988@foxmail.com>

pkgname=yunio
pkgver=3.0.7
pkgrel=1
pkgdesc="Yunio Cloud Storage and Syncing to http://www.yunio.com"
arch=('i686' 'x86_64')
url="https://www.yunio.com/"
license=("Custom:yunio")
depends=( 'qt4' 'glib2' 'pcre' 'libffi' 'fontconfig' 'libsm' 'libxext' 'libxrender')
provides=('yunio')

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('2a7f9f5cf3d5d83d1b89c5838c4c9a8b')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    md5sums=('9cd3d919e1ed463ccf0663a1c8e5f240')
fi

source=("https://static.yunio.com/download/yunio-${pkgver}-${_arch}.deb")

package(){
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/etc/sysctl.d
    msg2 "Extracting the data.tar.gz"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    cat <<EOF > 10-inotify.conf
fs.inotify.max_user_watches=892000
EOF
    install -Dm644 10-inotify.conf "${pkgdir}/etc/sysctl.d/10-inotify.conf"
} 




