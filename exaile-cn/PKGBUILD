# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: Leo Zhao <zhao78977@gmail.com>

# PKGBUILD of Exaile:
# https://aur.archlinux.org/packages/ex/exaile/PKGBUILD

pkgname=exaile-cn
_pkgname=exaile
pkgver=100721
_pkgver=0.3.2.0
pkgrel=2
pkgdesc='Exaile mod for Chinese users.'
url='https://exaile-cn.googlecode.com/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-chardet'
         'gstreamer0.10-python'
         'gstreamer0.10-good-plugins'
         'mutagen'
         'dbus-python'
         'pygtk>=2.10'
         'librsvg')
makedepends=('help2man')
optdepends=('pycddb: CD metadata retrieval'
            'python2-bsddb: music collection support'
	    'gstreamer0.10-bad-plugins: support for more formats'
	    'gstreamer0.10-ugly-plugins: support for more formats'
	    'gstreamer0.10-ffmpeg: support for more formats')
conflicts=('exaile')
provides=('exaile=0.3.2.0')
install=${_pkgname}.install
source=("${url}/files/exaile-cn${pkgver}.tar.gz"
        "https://www.launchpad.net/${_pkgname}/${_pkgver%.*}/${_pkgver}/+download/${_pkgname}-${_pkgver}.tar.gz"
        "${url}/files/lrcMod.py"
        "${url}/files/Panel.py")
sha1sums=('c474561cb7a46a2f40ce94dde516065fc857d9c8'
          '08015ab647f5b83997bd2f1c87c14d3d287fd3e7'
          '2bf4c513cb6877a1e1d3cb0239646cc84e0cbcb6'
          '260d490b4cc77df1a5bc8fe9c1b8656272ca5ed8')

build() {
### exaile-cn
    cd "${srcdir}/exaile-cn${pkgver}"
    exaile_path="${srcdir}/${_pkgname}-${_pkgver}/"

# 解决乱码问题方法
    cp -f _id3.py "${exaile_path}/xl/metadata/"

# 豆瓣封面插件
    cp -r doubancovers "${exaile_path}/plugins/"

# 歌词同步显示插件
    cp -r LyricDisp "${exaile_path}/plugins/"
    cp -f engine_unified.py engine_normal.py "${exaile_path}/xl/player/"

# 面板标签竖行显示
    cp -f __init__.py "${exaile_path}/xlgui/"

# 豆瓣电台插件
    cp -f track.py "${exaile_path}/xl/trax/"
    cp -r doubanfm "${exaile_path}/plugins/"
    
# 补丁 谷歌音乐歌词支持
    cp -f "${srcdir}/lrcMod.py" "${exaile_path}/plugins/LyricDisp/"

# 补丁 查找音乐文件夹下歌词
    cp -f "${srcdir}/Panel.py" "${exaile_path}/plugins/LyricDisp/disp/Panel.py"
    
### exaile
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    # python2 fix
    for file in $(find . -name Makefile -print) tools/generate-launcher; do
        sed -i 's_python_python2_' $file
    done

    for file in plugins/*/*.py plugins/*.py exaile.py; do
        sed -i 's_#![ ]*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#![ ]*/usr/bin/env python_#!/usr/bin/python2_' $file
    done

    make
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}

#package() {
#    cd "${srcdir}/${_pkgname}-${_pkgver}"
#}
