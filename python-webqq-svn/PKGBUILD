# Maintainer: cuihao <cuihao dot leo at gmail dot com>

pkgname=python-webqq-svn
_pkgname=pywebqq
pkgver=15
pkgrel=2
pkgdesc="A WebQQ client based on python-webkit."
url="http://code.google.com/p/python-webqq/"
license=('Apache')
arch=('any')
depends=('python-keybinder' 'python2-notify' 'pywebkitgtk')
makedepends=('svn')
conflicts=('python-webqq', 'pywebqq')

source=('pywebqq.desktop')
md5sums=('72591fb99f6437f6ebfb223790d77ece')

_svnmod="python-webqq"
_svntrunk="http://python-webqq.googlecode.com/svn/trunk/python-webqq"

build() {
    cd ${srcdir}
    msg "Connecting to the SVN server...."
  
    if [ -d "${_svnmod}/.svn" ]; then
        cd "${_svnmod}" && svn up -r "${pkgver}"
        cd ${srcdir}
    else
        svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    fi
      
    msg "SVN checkout done or server timeout"
    
    rm -rf "${_svnmod}-build"
    cp -rf "${_svnmod}/src" "${_svnmod}-build"
    cd "${_svnmod}-build"
    
    # Arch默认使用python3，修改为使用python2执行
    sed -i "1s/python/python2/" *.py

    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    cp ./* "${pkgdir}/usr/share/${_pkgname}"
    
    mkdir "${pkgdir}/usr/bin"
    ln -s "../share/${_pkgname}/pywebqq.py" "${pkgdir}/usr/bin/${_pkgname}"
    
    # 菜单项
    mkdir "${pkgdir}/usr/share/applications/"
    install -D -m644 ${srcdir}/pywebqq.desktop "${pkgdir}/usr/share/applications/"
}

