#Maintainer: Jove Yu <yushijun110 [at] gmail.com>

pkgname=deepin-emacs
pkgver=2.0
pkgrel=1
pkgdesc='Emacs for Linux Deepin. Made by LazyCat.'
arch=('i686' 'x86_64')
url='http://www.linuxdeepin.com/'
license=('Other')
install=deepin-emacs.install
depends=('emacs' 'w3m' 'aspell' 'aspell-en' 'texinfo' 'unclutter' 'ctags' 'cscope' 'libnotify' 'imagemagick' 'findutils' 'zsh' 'git' 'ttf-freefont' 'python2-pyflakes')

if [ "${CARCH}" = "i686" ]; then
    source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-emacs/deepin-emacs_2.0-1+git20131231092707~1a721989b2_i386.deb")
    md5sums=('d1b74ff036be699fbe10ff619eaa7df2')
else
    source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-emacs/deepin-emacs_2.0-1+git20131231092707~1a721989b2_amd64.deb")
    md5sums=('75a015cd6bdcb45dcaf2c106d9c290db')
fi

PKGEXT=".pkg.tar"

package()
{
	tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
