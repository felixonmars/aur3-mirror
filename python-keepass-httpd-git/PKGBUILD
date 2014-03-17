_pkgname=python-keepass-httpd
pkgname=python-keepass-httpd-git
pkgver=45+g09c7943
pkgrel=1
pkgdesc='Python Keepass HTTP server to use with ChromeIPass'
url='https://github.com/bhedrich/python-keepass-httpd'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'python2-distribute' 'python2-docopt' 
	 'python2-daemon' 'python2-setproctitle' 'python2-crypto'
	 'python2-keepass-git')
makedepends=('git')
source=(git+https://github.com/bhedrich/python-keepass-httpd)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --prefix=/usr --optimize 1 --root="${pkgdir}"
}

