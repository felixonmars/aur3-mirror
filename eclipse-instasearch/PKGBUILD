# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>

pkgname=eclipse-instasearch
pkgver=1.5.6
pkgrel=1
pkgdesc="Eclipse plugin for performing quick and advanced search of workspace files"
arch=('any')
url="https://github.com/ajermakovics/eclipse-instasearch"
license=('EPL')
depends=('eclipse')
source=('feature_org.apache.lucene_2.9.1.jar::http://dl.bintray.com/ajermakovics/InstaSearch/features/org.apache.lucene_2.9.1.jar'
        'plugin_org.apache.lucene_2.9.1.v201101211721.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene_2.9.1.v201101211721.jar'
        'plugin_org.apache.lucene.analysis_2.9.1.v201101211721.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.analysis_2.9.1.v201101211721.jar'
        'plugin_org.apache.lucene.core_2.9.1.v201101211721.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.core_2.9.1.v201101211721.jar'
        'plugin_org.apache.lucene.highlighter_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.highlighter_2.9.1.v20100421-0704.jar'
        'plugin_org.apache.lucene.memory_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.memory_2.9.1.v20100421-0704.jar'
        'plugin_org.apache.lucene.misc_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.misc_2.9.1.v20100421-0704.jar'
        'plugin_org.apache.lucene.queries_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.queries_2.9.1.v20100421-0704.jar'
        'plugin_org.apache.lucene.snowball_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.snowball_2.9.1.v20100421-0704.jar'
        'plugin_org.apache.lucene.spellchecker_2.9.1.v20100421-0704.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/org.apache.lucene.spellchecker_2.9.1.v20100421-0704.jar'
        'feature_it.unibz.instasearch.feature.indigo_1.5.6.jar::http://dl.bintray.com/ajermakovics/InstaSearch/features/it.unibz.instasearch.feature.indigo_1.5.6.jar'
        'plugin_it.unibz.instasearch_1.5.6.jar::http://dl.bintray.com/ajermakovics/InstaSearch/plugins/it.unibz.instasearch_1.5.6.jar')
noextract=("${source[@]%%::*}")
md5sums=('69aa083fb4d1ea69dcb6f9fb499859dc'
         'b4dd9c45515c5ad8ecfa69e358a78c81'
         'e2878a16d87126f4074780f27a29aceb'
         'e9261f1d37045a96e2ede8565e08dc09'
         'f922b713bd01e729aed6efbed4d5c990'
         '1850da0dd7e45cc21f5f78d1060ef821'
         '435821f66a5181c607c1cc5d7cf14e5c'
         '150315a97a57ca0a4da8a4f5273ab96b'
         '95550d6658f3b2e8ad3ff7c04a0275a6'
         '3869bf64f2e4095e106c8b750c912a67'
         '9c71330f4f404a7a8bb3f184d6b2164f'
         'e9b31b4483d51ade8f1f1a799a30daf1')

package() {
  _dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  mkdir {features,plugins}
  cp 'feature_org.apache.lucene_2.9.1.jar' \
     'feature_it.unibz.instasearch.feature.indigo_1.5.6.jar' \
     features
  rename 'feature_' '' features/*

  cp 'plugin_org.apache.lucene_2.9.1.v201101211721.jar' \
     'plugin_org.apache.lucene.analysis_2.9.1.v201101211721.jar' \
     'plugin_org.apache.lucene.core_2.9.1.v201101211721.jar' \
     'plugin_org.apache.lucene.highlighter_2.9.1.v20100421-0704.jar' \
     'plugin_org.apache.lucene.memory_2.9.1.v20100421-0704.jar' \
     'plugin_org.apache.lucene.misc_2.9.1.v20100421-0704.jar' \
     'plugin_org.apache.lucene.queries_2.9.1.v20100421-0704.jar' \
     'plugin_org.apache.lucene.snowball_2.9.1.v20100421-0704.jar' \
     'plugin_org.apache.lucene.spellchecker_2.9.1.v20100421-0704.jar' \
     'plugin_it.unibz.instasearch_1.5.6.jar' \
     plugins
  rename 'plugin_' '' plugins/*

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -d "${_dest}"/${_feature%*.jar}
      cd "${_dest}"/${_feature/.jar}
      jar xf "${srcdir}/${_feature}" || return 1
    else
      install -Dm644 ${_feature} "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} "${_dest}/${_plugin}"
  done
}

# vim:set sts=2 sw=2 ts=2 et:
