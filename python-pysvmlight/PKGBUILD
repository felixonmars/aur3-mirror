pkgname=python-pysvmlight
pkgver=0.4
pkgrel=1
pkgdesc="A Python binding to the popular SVM-Light support vector machine library"
url="http://bitbucket.org/wcauchois/pysvmlight"
depends=('python2' )
makedepends=('python2-pip')
license=('MIT')
arch=('any')
source=('https://bitbucket.org/wcauchois/pysvmlight/get/4261689549aa.tar.gz')
md5sums=('6d6a8a00d6895c117209008f832d09e8')

build() {
    cd $srcdir/wcauchois-pysvmlight-4261689549aa/
    sudo pip2 install --no-deps . 

}

