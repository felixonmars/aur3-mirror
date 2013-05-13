# Maintainer: David Morgan <dmorgan81[at]gmail[dot]com>

pkgname=eclipse-bytecode-outline
pkgver=2.4.0
pkgrel=1
pkgdesc="Shows disassembled bytecode of current Java editor or class file"
arch=('i686' 'x86_64')
url="http://asm.ow2.org/eclipse/index.html"
depends=('eclipse>=3.6')
source=(http://download.forge.objectweb.org/asm/de.loskutov.BytecodeOutline.update_${pkgver}.zip)
license=('EPL')

package() {
    _dest=${pkgdir}/usr/share/eclipse/dropins/bytecode-outline/eclipse

    cd ${srcdir}

    find features -type f | while read _feature; do
        if [[ ${_feature} =~ (.*\.jar$) ]]; then
            install -dm755 ${_dest}/${_feature%*.jar}
            cd ${_dest}/${_feature/.jar}
            jar xf ${srcdir}/${_feature} || return 1
            cd - >/dev/null 2>&1
        fi
    done

    find plugins -type f | while read _plugin; do
        install -Dm644 ${_plugin} ${_dest}/${_plugin}
    done
}

md5sums=('e2ffa177a0bd4d4a70e15fe951a15cf6')
