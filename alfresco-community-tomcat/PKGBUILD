# Contributor: Tom < reztho at archlinux dot us >
pkgname=alfresco-community-tomcat
pkgver=3.3
pkgrel=1
pkgdesc="The Open Source Alternative for Enterprise Content Management. Apache Tomcat included."
arch=('any')
url="http://www.alfresco.com/"
license=('GPL')
depends=('jdk')
optdepends=('mysql' 'postgresql' 'iptables' 'openoffice-base' 'imagemagick' 'swftools')
provides=('alfresco')
conflicts=('alfresco-labs-tomcat')
backup=('etc/conf.d/alfresco'
        'opt/Alfresco/tomcat/shared/classes/alfresco-global.properties'
        'opt/Alfresco/tomcat/shared/classes/alfresco/extension/web-client-config-custom.xml')
install=${pkgname}.install
_mysqlconame=mysql-connector-java
_mysqlcover=5.1.12
_postgrecover=8.4-702
source=(
"http://downloads.sourceforge.net/alfresco/${pkgname}-${pkgver}.tar.gz"
"http://mirrors.ukfast.co.uk/sites/ftp.mysql.com/Downloads/Connector-J/${_mysqlconame}-${_mysqlcover}.tar.gz"
"http://jdbc.postgresql.org/download/postgresql-${_postgrecover}.jdbc4.jar"
'alfresco.rc'
'alfresco.confd'
)
noextract=("${pkgname}-${pkgver}.tar.gz" "postgresql-${_postgrecover}.jdbc4.jar")

build() {
    # Installing the daemon script
    mkdir -p ${pkgdir}/etc/rc.d/
    install -m 755 ${srcdir}/alfresco.rc ${pkgdir}/etc/rc.d/alfresco
    mkdir -p ${pkgdir}/etc/conf.d/
    install -m 644 ${srcdir}/alfresco.confd ${pkgdir}/etc/conf.d/alfresco
    
    # Uncompressing Alfresco to its place
    mkdir -p ${pkgdir}/opt/Alfresco
    cd ${pkgdir}/opt/Alfresco
    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz || return 1

    # Putting the Mysql and PostgreSQL connectors in their right place
    cd ${srcdir}/${_mysqlconame}-${_mysqlcover}
    cp ${_mysqlconame}-${_mysqlcover}-bin.jar ${pkgdir}/opt/Alfresco/tomcat/lib || return 1
    cp ${srcdir}/postgresql-${_postgrecover}.jdbc4.jar ${pkgdir}/opt/Alfresco/tomcat/lib || return 1

    # Modifying alfresco.sh ...
    _sedscript=${startdir}/sedscript.sed
    cd ${pkgdir}/opt/Alfresco
    # - Adding JAVA_HOME variable
    echo "/ALF_HOME=./ a \\" > ${_sedscript}
    echo 'export JAVA_HOME=/opt/java' >> ${_sedscript}
    sed -i -f ${_sedscript} alfresco.sh || return 1
    # - Indicating where Alfresco resides
    sed -i 's@ALF_HOME=.@ALF_HOME=/opt/Alfresco@' alfresco.sh || return 1
    # - Extending the maximal memory limit used by the java process to a gigabyte
    sed -i 's@Xmx512m@Xmx1024m@' alfresco.sh || return 1
    # - Commenting some JAVA_OPTS not needed because of the archlinux version of java
    sed -i 's@export JAVA_OPTS="${JAVA_OPTS} -XX:CompileCommand=@#export JAVA_OPTS="${JAVA_OPTS} -XX:CompileCommand=@' alfresco.sh || return 1

    # Modifying some default configurations
    # - Changing dir.root (Alfresco Data directory)
    mkdir -p ${pkgdir}/opt/alfresco_data
    cd ${pkgdir}/opt/Alfresco/tomcat/shared/classes/
    cp alfresco-global.properties alfresco-global.properties.backup || return 1
    sed -i 's@dir\.root=\./alf_data@dir.root=/opt/alfresco_data@' alfresco-global.properties || return 1
    # - Configuring OpenOffice support
    sed -i 's@#ooo\.exe=soffice@ooo.exe=/usr/bin/soffice@' alfresco-global.properties || return 1
    # - Configuring ImageMagick support
    sed -i 's@#img\.root=\./ImageMagick@img.root=/usr@' alfresco-global.properties || return 1
    # - Configuring swftools support
    sed -i 's@#swf\.exe=\./bin/pdf2swf@swf.exe=/usr/bin/pdf2swf@' alfresco-global.properties || return 1
    # - Automatic Guest login off
    echo >> alfresco-global.properties || return 1
    echo '# Disable Guest login:' >> alfresco-global.properties || return 1
    echo 'alfresco.authentication.allowGuestLogin=false' >> alfresco-global.properties || return 1
    # - This will let the existance of independent archlinux packages of alfresco language packs
    cd ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/extension/
    cp web-client-config-custom.xml web-client-config-custom.xml.backup || return 1
    
    echo '/^\s*<!-- Example of adding languages to the list in the login page -->\r$/,/^\s*<!-- Example of configuring advanced search -->\r$/ {' > ${_sedscript}
    echo '/^\s*<!--\r$/ d' >> ${_sedscript}
    echo '/^\s*-->\r$/ d' >> ${_sedscript}
    echo '}' >> ${_sedscript}
    sed -i -f ${_sedscript} web-client-config-custom.xml || return 1

    sed -i 's@^         <language @         <!-- <language @g' web-client-config-custom.xml || return 1
    sed -i 's@/language>\r$@/language> -->@g' web-client-config-custom.xml || return 1
    
    # Removing the sed script made by the PKGBUILD
    rm ${_sedscript}
}

md5sums=('f65a2791c00bf236d08866cd2bc19151'
         'd2f836c761614a3fdf39f7a6c7c1acb5'
         '584b6c9b962b8693b2856dd16c71043a'
         '6008659b210df76b490c2139999e447e'
         '5a31758e54bc1c968a2c6b225786b29a')
