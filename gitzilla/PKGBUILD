# Contributor: Charles Briere <charlesbriere dot flatzo at gmail dot com>

pkgname=gitzilla
pkgver=2.0
pkgrel=1
pkgdesc="Comment bugzilla's bug on git commit (hook in git)"
arch=('i686' 'x86_64')
url="http://www.theoldmonk.net/gitzilla/"
license=('')
depends=("python2>=2.5" "pybugz" "python2-distribute")
source=(https://github.com/gera/gitzilla/tarball/gitzilla-2.0)
md5sums=('e81829aec495386deed2ec4cc05dec7e')



build() {
    cd $srcdir
    tar -xvf gitzilla-2.0
    cd gera-gitzilla-2078533
    sudo mv etc/gitzillarc /etc/gitzillarc
    
    python2 setup.py install --root=$pkgdir
 
    echo ""
    echo "------------------------------------------"
    echo "Configuration file is : /etc/gitzillarc"
    echo "Don't forget to visit the official website"
    echo "for help with the configuration "
    echo ${url}
    echo "------------------------------------------"
}

